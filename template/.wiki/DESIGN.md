---
name: [Product Name]
colors:
    # Foundation — background & surface elevation layers
    background: "#000000"
    on-background: "#e4e4e4"
    surface-dim: "#000000"
    surface: "#030303"
    surface-bright: "#121212"
    surface-container-lowest: "#000000"
    surface-container-low: "#020202"
    surface-container: "#030303"
    surface-container-high: "#090909"
    surface-container-highest: "#121212"
    on-surface: "#e4e4e4"
    on-surface-variant: "#8f8f8f"
    inverse-surface: "#e4e4e4"
    inverse-on-surface: "#121212"
    # Borders & outlines
    outline: "#3a3a3a"
    outline-variant: "#262626"
    surface-tint: "#4c8adc"
    # Primary — main interactive and brand colour
    primary: "#4c8adc"
    on-primary: "#020202"
    primary-container: "#001439"
    on-primary-container: "#abc6eb"
    inverse-primary: "#002478"
    # Secondary — highlights, CTAs, emphasis
    secondary: "#dea300"
    on-secondary: "#060606"
    secondary-container: "#3f2900"
    on-secondary-container: "#fbd276"
    # Tertiary — subtle accents
    tertiary: "#b17be5"
    on-tertiary: "#07040b"
    tertiary-container: "#2e0e46"
    on-tertiary-container: "#d4b4f8"
    # Semantic — status indicators
    success: "#00c766"
    on-success: "#000201"
    success-container: "#001501"
    on-success-container: "#8ce5aa"
    warning: "#f2bb25"
    on-warning: "#0d0902"
    warning-container: "#392500"
    on-warning-container: "#fbd276"
    error: "#f14e46"
    on-error: "#080201"
    error-container: "#560001"
    on-error-container: "#ffc4bb"
    info: "#00b5e7"
    on-info: "#010203"
    info-container: "#001524"
    on-info-container: "#94d9f6"
    # Fixed tonal pairs (optional — keep if the design uses fixed accent tints)
    primary-fixed: "#b5d0f5"
    primary-fixed-dim: "#4c8adc"
    on-primary-fixed: "#020202"
    on-primary-fixed-variant: "#001439"
    secondary-fixed: "#fcda90"
    secondary-fixed-dim: "#dea300"
    on-secondary-fixed: "#060606"
    on-secondary-fixed-variant: "#3f2900"
    tertiary-fixed: "#e4caff"
    tertiary-fixed-dim: "#b17be5"
    on-tertiary-fixed: "#07040b"
    on-tertiary-fixed-variant: "#2e0e46"
typography:
    headline-lg:
        {
            fontFamily: "[Display Font]",
            fontSize: 28px,
            fontWeight: "600",
            lineHeight: "1.3",
            letterSpacing: -0.01em,
        }
    headline-md:
        {
            fontFamily: "[Display Font]",
            fontSize: 22px,
            fontWeight: "600",
            lineHeight: "1.35",
        }
    headline-sm:
        {
            fontFamily: "[Display Font]",
            fontSize: 18px,
            fontWeight: "500",
            lineHeight: "1.4",
        }
    body-lg:
        {
            fontFamily: "[Body Font]",
            fontSize: 16px,
            fontWeight: "400",
            lineHeight: "1.6",
        }
    body-md:
        {
            fontFamily: "[Body Font]",
            fontSize: 14px,
            fontWeight: "400",
            lineHeight: "1.6",
        }
    body-sm:
        {
            fontFamily: "[Body Font]",
            fontSize: 13px,
            fontWeight: "400",
            lineHeight: "1.5",
        }
    label-lg:
        {
            fontFamily: "[Body Font]",
            fontSize: 14px,
            fontWeight: "600",
            lineHeight: "1.2",
            letterSpacing: 0.02em,
        }
    label-md:
        {
            fontFamily: "[Body Font]",
            fontSize: 12px,
            fontWeight: "600",
            lineHeight: "1.2",
            letterSpacing: 0.05em,
        }
    label-sm:
        {
            fontFamily: "[Body Font]",
            fontSize: 11px,
            fontWeight: "600",
            lineHeight: "1.2",
            letterSpacing: 0.08em,
        }
    # Monospace roles for numeric/tabular data
    mono-lg:
        {
            fontFamily: "[Mono Font]",
            fontSize: 24px,
            fontWeight: "600",
            lineHeight: "1.2",
        }
    mono-md:
        {
            fontFamily: "[Mono Font]",
            fontSize: 14px,
            fontWeight: "500",
            lineHeight: "1.4",
        }
    mono-sm:
        {
            fontFamily: "[Mono Font]",
            fontSize: 12px,
            fontWeight: "500",
            lineHeight: "1.4",
        }
rounded:
    none: 0
    sm: 0.25rem
    DEFAULT: 0.375rem
    md: 0.5rem
    lg: 0.75rem
    xl: 1rem
    full: 9999px
spacing:
    unit: 4px
    # Add product-specific named dimensions as rows below
    table-row-height: [px]
    header-height: [px]
    gutter: [px]
    stack-xs: 4px
    stack-sm: 8px
    stack-md: 16px
    stack-lg: 24px
    stack-xl: 32px
    content-max-width: [value or none]
---

## Brand & Style

[Name the central design concept or metaphor in 1 phrase, then 2-3 short paragraphs: what mood/aesthetic the product targets, who the user is and in what context they use it, and the guiding stylistic tension (e.g. dense vs. airy, light vs. dark, playful vs. precise). State any hard stances — e.g. "no light mode", "desktop-only", "OLED-first".]

[Name the two to four cues that make this interface recognisably this product's, at least one of them not a colour, and say where each appears and where it is withheld. State how expressive the interface is: how loud, how much layouts vary from view to view, and how much motion it uses.]

## Colors

[Describe the palette strategy in a sentence or two. Explain how elevation is conveyed (tonal layering vs. shadows) and why, given the product's needs. The hex tokens above are examples, not approved project colours. Use exact values from an approved brand kit or existing UI when available. If exploring in OKLCH, convert to final hex with a tool rather than estimating values.]

**Primary ([hue]):** [What it signals and where it is used.]

**Secondary ([hue]):** [What it signals and where it is used.]

**Tertiary ([hue]):** [What it signals and where it is used.]

**Semantic Colours:** Four fixed roles for status indicators:

| Semantic  | Hex       | Role                       |
| --------- | --------- | -------------------------- |
| `success` | `#RRGGBB` | [When this colour appears] |
| `warning` | `#RRGGBB` | [When this colour appears] |
| `error`   | `#RRGGBB` | [When this colour appears] |
| `info`    | `#RRGGBB` | [When this colour appears] |

[Borders (`outline` / `outline-variant`) are deliberately low-contrast — just visible enough to contain a table or card without drawing attention from the data inside them.]

### Accessibility of Colour

**Colour is never the sole indicator of meaning.** [State how each colour-coded element also carries text/icon/pattern — status badges pair colour + label, KPI cards pair accent border + icon, error states pair red border + icon + descriptive text.]

**Contrast compliance:** [State the target standard, e.g. WCAG 2.2 AA (4.5:1 minimum) for normal text and AAA (7:1) for body text on surface containers. Calculate ratios from final hex values with a contrast checker; do not estimate them or call unmeasured pairs verified.] Verified pairings (fill only after measurement):

| Text Role | Foreground            | Background            | Ratio         |
| --------- | --------------------- | --------------------- | ------------- |
| [Role]    | `[token]` (`#RRGGBB`) | `[token]` (`#RRGGBB`) | X:1 (AA/AAA) |
| [Role]    | `[token]` (`#RRGGBB`) | `[token]` (`#RRGGBB`) | X:1 (AA/AAA) |

## Typography

[Describe the type strategy: chosen typeface(s) and why, and the pairing rationale.]

- **[Font 1] ([category]):** [Where used and why.]
- **[Font 2] ([category]):** [Where used and why.]

**Scale principle:** [How headline/body/label/mono roles are applied — e.g. headlines use the display font for a distinctive identity, body and labels use the body font for long-session comfort, monospace roles are reserved for numeric data.]

[State how fonts are loaded — bundled/self-hosted/google-fonts — and the rationale.]

### [Optional] Value & Number Formatting

[If the product displays formatted data, specify formatting rules: currency (prefixed, decimal places), counts (raw integer vs. abbreviated), ratings (glyph-based vs. numeric), tabular figures, abbreviation thresholds.]

## Design Principles

[Non-negotiable constraints every component and interaction must satisfy. Number them; each is a short imperative rule with a concrete test. Adapt to the product — the list below is a starting set.]

[Include the rules that keep the interface specific to this product: where its signature treatment appears and where it must not, and what this product does in place of the defaults it would otherwise fall into. A mood word such as "clean" or "modern" is not a principle.]

1. **[Principle]:** [Rule + how it's verified.]
2. **[Principle]:** [Rule + how it's verified.]
3. **[Principle]:** [Rule + how it's verified.]

## Layout & Spacing

[Describe the top-level layout model (single-window tabbed dashboard, multi-pane, responsive page, etc.), the target/minimum viewport width, and the primary visual regions in order (header bar, navigation, content area).]

[State the spacing rhythm — which named stack steps are used between related elements, sections, and major blocks. Mention any hard layout dimensions (table row height, card widths, header height) and whether content width is clamped or fills available space.]

## Elevation & Depth

[Describe how depth is expressed (tonal layering vs. drop shadows) and why this matters for the product's density needs. Enumerate elevation levels:]

- **Level 0 ([name]):** `[token]` — [what lives at this level].
- **Level 1 ([name]):** `[token]` — [what lives at this level].
- **Level 2 ([name]):** `[token]` — [what lives at this level].
- **Level 3 ([name]):** `[token]` — [what lives at this level.]

### Z-Index Scale

[State the fixed z-index scale — no element uses arbitrary large values. Layers are separated by steps of 10 to leave room for future insertion.]

| Layer         | Value  | Usage                                   |
| ------------- | ------ | --------------------------------------- |
| Base          | `z-0`  | Content area, tables, cards             |
| Sticky        | `z-10` | Sticky headers, sticky nav              |
| Dropdown      | `z-20` | Select dropdowns, autocomplete panels   |
| Context Menu  | `z-30` | Right-click context menus               |
| Overlay       | `z-40` | Modal backdrops, toast container region |
| Modal Content | `z-50` | Modal dialogs, individual toasts        |

[Every component that creates a new stacking context declares its `z-index` from this scale. Components at the same layer must not overlap in normal use; if they can, use source-order stacking within the layer.]

## Shapes

[Name the shape language — e.g. "Sharp-Industrial" or "Soft-Rounded" — and map radii to element classes.]

- **[Element class]:** `[radius token]` ([value]). [Rationale if non-obvious.]
- **Focus Rings:** [Width, colour, radius. Always `:focus-visible`, never `:focus`.]

## Components

Spec each reusable component with the skeleton below. Duplicate the block per component. Order from most-used to least. Reference design tokens by name (never raw values in prose).

### [Component Name]

[One-line purpose: what it is and where it is used.]

- **Container:** [Background token, border, radius, padding, sizing constraints.]
- **States:** [Default / hover / active / focus / disabled / loading — describe the visual change for each and the transition used. No layout-shifting hovers.]
- **Variants:** [List each variant and what differs (colour, size, role).]
- **Content / Anatomy:** [Internal structure — icon, label, value, subtext — with the token/type-role for each.]
- **Behaviour:** [Interaction, keyboard support, feedback, error/empty/loading handling relevant to this component.]

<!--
Common components to spec for most products (add/remove as needed):
- Buttons & Interaction (primary, secondary, ghost, destructive, icon variants)
- Input Fields (text, number, date, select, textarea)
- Data Tables / Lists
- Modals (informational, form, destructive confirmation)
- Context Menu
- Toast / Notification
- Tabs / Navigation
- Status Badges / Chips
- Empty States
- Loading States / Skeleton Screens
- Error Boundary
- Scrollbars (custom-styled)
- Focus Ring & Keyboard Navigation
- Window Chrome (if desktop app)
- Animations & Transitions
- Icon System
- Typography Overflow / Truncation
-->

---

## Pre-Delivery Checklist

Before delivering any UI code, verify. [Adapt items to the product; grouped by concern.]

### Fit to the Product

- [ ] Every colour, radius, shadow, spacing, and type value comes from this document's tokens — no framework or component-kit default left in place
- [ ] The signature treatment appears only where this document places it
- [ ] Every gradient, glow, badge, icon, and animation has a job this document names
- [ ] With the name and logo hidden, the screen still reads as this product

### Visual Quality

- [ ] No emojis used as icons (use your chosen icon library instead)
- [ ] All icons from a consistent icon set (identical viewBox, stroke width, join style)
- [ ] Colour is never the sole indicator of meaning — paired with text, icon, or pattern
- [ ] All text-on-background combinations meet the contrast minimum (verify against the contrast table in the Colors section)

### Interaction

- [ ] `cursor-pointer` on all clickable elements
- [ ] Hover states use colour/opacity transitions only — no layout-shifting effects (scale, margin, padding, font-weight changes on hover)
- [ ] Focus states visible only via `:focus-visible` (not `:focus`)
- [ ] Every mutation shows loading → success/error feedback — no silent updates
- [ ] Destructive actions require explicit confirmation before executing

### Accessibility

- [ ] Skip link present and functional (first Tab press)
- [ ] All interactive elements reachable via keyboard in logical Tab order
- [ ] Modals trap focus and dismiss on Escape
- [ ] Context menus navigable with arrow keys, dismissable on Escape
- [ ] `prefers-reduced-motion: reduce` respected — non-essential animations disabled

### Z-Index & Layout

- [ ] All `z-index` values come from the defined scale (10/20/30/40/50) — no arbitrary values
- [ ] No content hidden behind sticky navigation regions (account for combined height)

### States

- [ ] Loading, empty, and error states defined for every data view — never blank space
- [ ] Optimistic updates (if used) roll back on failure with an error message
- [ ] Toast auto-dismiss timers pause on hover
