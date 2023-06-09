module bartender

import term

fn (color Color) paint(s string, surface Surface) string {
	// vfmt off
	return term.colorize(match color {
		.reset { term.reset }
		.black { if surface == .bg { term.bg_black } else { term.black } }
		.red { if surface == .bg { term.bg_red } else { term.red } }
		.green { if surface == .bg { term.bg_green } else { term.green } }
		.yellow { if surface == .bg { term.bg_yellow } else { term.yellow } }
		.blue { if surface == .bg { term.bg_blue } else { term.blue } }
		.magenta { if surface == .bg { term.bg_magenta } else { term.magenta } }
		.cyan { if surface == .bg { term.bg_cyan } else { term.cyan } }
		.white { if surface == .bg { term.bg_white } else { term.white } }
		.gray { term.gray }
		.bright_black { if surface == .bg { term.bright_bg_black } else { term.bright_black } }
		.bright_red { if surface == .bg { term.bright_bg_red } else { term.bright_red } }
		.bright_green { if surface == .bg { term.bright_bg_green } else { term.bright_green } }
		.bright_yellow { if surface == .bg { term.bright_bg_yellow } else { term.bright_yellow } }
		.bright_blue { if surface == .bg { term.bright_bg_blue } else { term.bright_blue } }
		.bright_magenta { if surface == .bg { term.bright_bg_magenta } else { term.bright_magenta } }
		.bright_cyan { if surface == .bg { term.bright_bg_cyan } else { term.bright_cyan } }
		.bright_white { if surface == .bg { term.bright_bg_white } else { term.bright_white } }
	}, s)
	// vfmt on
}

fn (colors FgBg) paint_fg_bg(s string) string {
	return colors.bg.paint(colors.fg.paint(s, .fg), .bg)
}

fn (color ColorType) paint_component(s string) string {
	return match color {
		FgBg { color.paint_fg_bg(s) }
		Color { color.paint(s, .fg) }
	}
}
