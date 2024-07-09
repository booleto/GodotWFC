class_name TestDriver

static func run_tests():
    WaveTest.test_wave_idx()
    WaveTest.test_get_set_value()
    WaveTest.test_fill()

    print_rich(
        "[tornado]",
            "[color=#FF0000]A[/color]",
            "[color=#FF5A00]l[/color]",
            "[color=#FFB400]l[/color]",
            " ",
            "[color=#95FF00]t[/color]",
            "[color=#3BFF00]e[/color]",
            "[color=#00FF1E]s[/color]",
            "[color=#00FF78]t[/color]",
            "[color=#00FFD2]s[/color]",
            " ",
            "[color=#0077FF]p[/color]",
            "[color=#001DFF]a[/color]",
            "[color=#3C00FF]s[/color]",
            "[color=#9500FF]s[/color]",
            "[color=#F000FF]e[/color]",
            "[color=#FF00B3]d[/color]",
            "[color=#FF0059]![/color]",
        "[/tornado]"
    )