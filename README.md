# bartender

> Customizable bars for v term apps.

![smooth](https://user-images.githubusercontent.com/34311583/228962398-a7db6cea-3be3-4a21-ae95-a78f9e587a9c.gif)

## Getting started

- Install via vpm

  ```
  v install tobealive.bartender
  ```

  ```v
  // vpm installed modules require specification of the module provider.
  import tobealive.bartender
  ```

- Or clone the repository to a preferred location and link it to your `.vmodules` directory.

  ```
  git clone https://github.com/tobealive/bartender.git
  cd bartender
  ln -s $(pwd)/ ~/.vmodules/bartender
  ```

  ```v
  import bartender
  ```

## Usage examples

- Simple bar

  ```v
  mut b := bartender.Bar{}
  for _ in 0 .. b.iters {
   	b.progress()
  }
  ```

- Customizations

  ```v
  mut b := bartender.Bar{
  	width: 60
  	// Set custom runes
  	runes: bartender.BarRunes{
  		progress: `#`
  		remaining: `-`
  	}
  	indicator: `❯`
   	// Customize pre- and postfixes.
  	pre: '|'
  	post: bartender.Affix{
  		pending: '| Loading...'
  		finished: '| Done!'
  	}
  }
  for _ in 0 .. b.iters {
   	b.progress()
  }
  ```

- Bar Reader for io operations.

  ```v
  // 500 MB of sample content.
  content := '1234567890'.repeat(50 * 1024 * 1024)

  mut r := bartender.bar_reader(bartender.Bar{}, content.bytes())
  mut f := os.create('testfile') or { panic(err) }
  io.cp(mut r, mut f)!
  ```

### Run examples

Extended and executable examples can be found in the sample files.

```
v run examples/<file>.v
```

## Showcase

<details open><summary><b>Simple bar</b> &nbsp;<sub><sup>Toggle visibility...</sup></sub></summary>

![simple](https://user-images.githubusercontent.com/34311583/228962887-dbc76f93-4c82-43ed-95a1-964851fe3617.gif)

</details>

<details><summary><b>Color and style customizations.</b> &nbsp;<sub><sup>Toggle visibility...</sup></sub></summary>

![colors](https://user-images.githubusercontent.com/34311583/228962409-a5d9b3cb-b6d2-4b34-a2db-305249e95c82.gif)

</details>

<details><summary><b>Smooth bars.</b> &nbsp;<sub><sup>Toggle visibility...</sup></sub></summary>

![download](https://user-images.githubusercontent.com/34311583/228962385-2fd9e185-81a5-481a-aa9c-6101405bf64a.gif)

</details>

## Disclaimer

Until a stable version 1.0 is available, new features will be introduced, existing ones may change, or breaking changes may occur in minor(`0.<minor>.*`) versions.

## Outlook

Below are some of the things to look forward to.

- [x] Reader Interface
- [ ] Multiline
- [x] Time Remaining
- [ ] Dynamic adjustment on term resize for all variants (basic width detection works)
- [ ] Extend visuals & customizability

## Anowledgements

- [Waqar144/progressbar][10] inspired the start of project.
- [console-rs/indicatif][20] serves as inspiration for further development.

[10]: https://github.com/Waqar144/progressbar
[20]: https://github.com/console-rs/indicatif

```

```
