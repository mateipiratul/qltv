# QLTV Project Roadmap: Bottom-Up Development

## 1. Database & Schema Status (Completed)
- **Schema & Relationships:** `01_schema_create.sql` and `02_junctions_create.sql` are finalized, establishing a robust relational structure without redundant match participation junctions.
- **Triggers & Integrity:** `03_triggers_audit.sql` implements complex DB-side auditing (e.g., `trg_audit_echipe`, `trg_protectie_schema`) and constraints (e.g., `trg_limit_team_players`).
- **Seed Data:** `04_seed_data.sql` has been corrected with explicit IDs and subqueries to ensure resilience during insertions.
- **Java Models:** The `com.qltv.models` package is fully synchronized with the DB tables, handling inheritance (Member -> Player/Coach) successfully.

## 2. Backend Progression To-Do List

### Phase 2.1: Service Layer Implementation (Completed)
- [x] Create `AuthService` to handle login, registration, and password hashing (move out of `AuthController`).
- [x] Create `TeamService` and `MemberService` to orchestrate complex operations.
- [x] Create `MatchService` and `TournamentService` for scheduling and result processing.
- [x] Integrate `AuditService` (Java-based CSV) into all service operations.

### Phase 2.2: Advanced DAOs & Data Access Optimization (Completed - REVISITING)
- [x] Implement pagination and filtering parameters within DAOs (Marked for simplification).
- [x] Implement query caching within the Service layer (Marked for removal).

### Phase 2.3: Java-Side Auditing & Utilities (Completed)
- [x] Implement the **Java-based CSV Audit Service** as specified in the project requirements.
- [x] Expand `ValidationUtil.java` to encompass all business rules (e.g., valid date ranges for tournaments).

### Phase 2.4: Collections & Algorithms (Completed)
- [x] Integrate specific use of Sorted Collections (`TreeSet`) within `TeamService` to sort teams by world ranking locally.
- [x] Implement further required data processing algorithms (e.g., complex search/filter in `TournamentService`).
- [x] Conduct performance checks on the recursive comment threading algorithm in `MainController`/`CommentDAO` (implemented recursive `getTotalReplyCount` in `Comment`).

## Phase 3: Controllers & Services Implementation (Vanilla)

Purpose: implement controllers and services to provide a complete, working admin/management UI. Keep design simple and pragmatic — no advanced scaling patterns, no unit tests, no rate-limiting. Follow good backend practices: validate inputs in services, keep DB transactions safe in DAOs, run blocking DB calls off the JavaFX thread, and return clear user-facing errors.

General rules
- Use services from controllers (never call DAOs directly from UI controllers).
- All DB calls must run in background threads (`Task`) and update UI on the FX thread.
- Services must validate inputs and throw `IllegalArgumentException` for client errors; controllers catch and show messages.
- Audit create/update/delete actions using `AuditService` (already in place).
- Keep APIs and method names consistent: `getAll()`, `getById(id)`, `search(q)`, `save(entity)`, `delete(id)`.
- Avoid caching, rate-limiting, unit-tests, or other production-only concerns.

Priority checklist (implement in order)

1) Auth (Completed)
	- [x] Support login by username or email (identifier) and password (AuthService/AuthController).
	- [x] Ensure login runs in a `Task` from the controller and UI shows a progress indicator while authenticating.
	- [x] Show clear messages for invalid credentials and for disabled accounts; use `SessionManager` on success.
	- [x] Registration: ensure `AuthService.register` is used, validation happens in service (email format, username length, password strength), and controller shows friendly errors.

2) Members (players & coaches) (Completed)
	- [x] Use `MemberService` from `MemberController` (done).
	- [x] Async loading and progress placeholder (done).
	- [x] CRUD handlers and simple form dialog (done). Consider adding `member_form.fxml` if fields grow.
	- [x] Search + type filter + pagination (done).
	- [x] Add edit-confirmation flows and disable Edit/Delete when no selection.
	- [x] Add server-side validations in `MemberService.save()` for business rules (unique nickname already added) and show concise errors.

3) Teams (Completed)
	- [x] Implement `TeamService` with `getAll()`, `getById()`, `search()`, `save()`, `delete()`; validate `nume_echipa` and `tag_echipa` lengths.
	- [x] Create `TeamController` with table, search, pagination, add/edit/delete flows, and detail view.
	- [x] Provide sponsor-management in `TeamController` (link/unlink sponsor) calling a `SponsorshipDAO` or `SponsorshipService`.
	- [x] Mark team CRUD actions in `AuditService`.

4) Tournaments (Completed)
	- [x] Implement `TournamentService` with basic scheduling helpers and validation (start <= end date).
	- [x] `TournamentController`: list/search/paginate, create/edit dialogs, date pickers for period, show basic summary (prize, organizer).
	- [x] Keep validation for `data_inceput` and `data_sfarsit` in the service; show errors in the controller.

5) Matches (Completed)
	- [x] Implement `MatchService` and `MatchController` for creating matches, assigning teams, scheduling, and recording basic results.
	- [x] Use DAOs transactionally when creating a match and its map instances — ensure rollback on failure.
	- [x] Provide basic filters (tournament, date range) and pagination for lists.

6) Sponsors & Logistics (Completed)
	- [x] `SponsorService` + `SponsorController` for CRUD, validation of URLs/email formats (use `ValidationUtil`).
	- [x] `OrganizerService` / `Region/Country` controllers: read-only listing, selection in forms.

7) Cross-cutting service responsibilities (Completed)
	- [x] Each `save()` must perform input validation and return descriptive messages via exceptions.
	- [x] All create/update/delete must call `AuditService` for traceability.
	- [x] Offer lightweight `search(query)` methods for controllers to call (server-side filtering preferred when dataset grows). For now, implement client-side search for small lists, and DAO-level parameterized queries (limit/offset) for longer lists.
	- [x] Keep password hashing in `AuthService` (SHA-256 is acceptable for this simple project).

8) Controllers - implementation checklist (Completed)
	- [x] Use service instance field: `private final XService xService = new XService();`
	- [x] Provide `initialize()` that sets up columns, `FilteredList` + `SortedList`, and binds sorting to table comparator.
	- [x] Load data in a `Task`, show `ProgressIndicator`, then populate observable list on success.
	- [x] Add UI handlers: `onAdd()`, `onEdit()`, `onDelete()`, `onRefresh()`, wired to FXML buttons.
	- [x] Add modal dialogs or dedicated FXML forms for create/edit flows. Validate inputs before calling `service.save()`.
	- [x] Disable action buttons when no selection or while a background task is running.
	- [x] Catch `IllegalArgumentException` and show user-friendly `Alert` with the message. For unexpected exceptions, show a generic message and log stack trace.

9) FXML / UI tasks (Completed)
	- [x] Add Add/Edit/Delete/Refresh buttons to views and wire them to controller handlers.
	- [x] Add `Pagination` controls for lists that can grow, and wire page size constant in the controller (e.g., 10-25 rows per page).
	- [x] Add simple Combobox filters (type/team/organizer) next to the search field.
	- [x] Use consistent success/error alerts and an inline `Label` for transient validation messages.

10) DAO responsibilities (Completed)
	 - [x] Keep DAOs using `try-with-resources` and explicit commit/rollback when multiple related statements are executed.
	 - [x] Provide simple paginated DAO queries: `List<T> getAll(int limit, int offset)` and `int countAll()` to support pagination at DB level if needed.
	 - [x] Map DB exceptions to meaningful messages where possible; otherwise log and rethrow as runtime exceptions for controller handling.

11) Final polishing (Completed)
	 - [x] Add small UI polish: disable buttons during tasks, spinner on long operations, consistent button placement.
	 - [x] Update README with instructions for running the app, DB setup, and where to find key controllers/services.

### Phase 4: Oversimplification & Architectural Alignment (Completed)
- [x] **Simplify DAOs:** Removed unused database-level pagination and complex filtering from `TournamentDAO` and `MatchDAO`; reverted to simple `getAll()` and `getById()`.
- [x] **Remove Caching:** Stripped service-level caching from `CountryService`, `RegionService`, `MapService`, and `RoleService` to keep it "vanilla".
- [x] **Centralize Auditing:** Standardized repetitive `AuditService` calls across all services.
- [x] **Fix Service Violations:** Ensured `PlayerDetailController` and `CoachDetailController` use `ContractService` instead of accessing `ContractDAO` directly.
- [x] **Standardize Validations:** Ensured all services use `ValidationUtil` consistently.

### Phase 5: Missing Feature Completion (Completed)
- [x] **Team Sponsor Management:** Implemented UI in `TeamController` to link/unlink sponsors using `SponsorshipService`.
- [x] **Full Tournament Creation:** Added dropdowns for `Organizer` and `EventType` in `TournamentController` to enable full record creation.
- [x] **Recursive Metric Display:** Showing the recursive "Total Reply Count" in the news feed UI next to comment headers.
- [x] **Refine Team Sorting:** Added "Sort by Rank" button in Team view to explicitly demonstrate `TreeSet` usage.


Remark: this checklist is intentionally pragmatic and minimal — it focuses on what a small, vanilla admin client needs to be usable and maintainable. It avoids heavy production concerns (no unit tests, no caching, no rate limiting). Follow the service-first pattern: controllers delegate to services; services validate and call DAOs; DAOs manage JDBC resources and transactions.
