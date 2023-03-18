shell
{
	var
	{
		isw11=sys.is11
	}
	
	set
	{
		theme
		{
			name = "modern"
			
			background
			{
				color = #1e1e2e
				opacity = 100
			}

			item
			{
				opacity = 100

				prefix = 1

				text
				{
					normal = #cdd6f4
					select = #cdd6f4
					normal-disabled = #a6adc8
					select-disabled = #a6adc8
				}

				back
				{
					select = #45475a
					select-disabled = #313244
				}
			}

			border
			{
				enabled = true
				size = 1
				color = #eba0ac
				opacity = 100
				radius = 2
			}

			shadow
			{
				enabled = true
				size = 5
				opacity = 5
				color = #11111b
			}

			separator
			{
				size = 1
				color = #313244
			}

			symbol
			{
				normal = #eba0ac
				select = #eba0ac
				normal-disabled = #a6adc8
				select-disabled = #a6adc8
			}

			image
			{
				enabled = true
				color = [#cdd6f4, #eba0ac, #1e1e2e]
			}
		}		
		
		exclude.where = !process.is_explorer
		showdelay=200
	}

	images import 'imports/images.nss'

	static
	{	
		import 'imports/static.nss'
		item(where=this.title.length > 25 menu=title.more_options)
	}

	dynamic
	{
		menu(mode="multiple" title="Pin/Unpin" image=icon.pin) { }
		menu(mode="multiple" title=title.more_options image=icon.more_options) { }
		
		import 'imports/file-manage.nss'
		import 'imports/develop.nss'
		import 'imports/goto.nss'
		
		menu(type="taskbar" vis=key.shift() pos=0 title=app.name image=\uE249)
		{
			item(title="config" image=\uE10A cmd='"@app.cfg"')
			item(title="manager" image=\uE0F3 admin cmd='"@app.exe"')
			item(title="directory" image=\uE0E8 cmd='"@app.dir"')
			item(title="version\t"+@app.ver vis=label col=1)
			item(title="docs" image=\uE1C4 cmd='https://nilesoft.org/docs')
			item(title="donate" image=\uE1A7 cmd='https://nilesoft.org/donate')
		}
		
		import if(isw11, 'imports/taskbar.nss')
	}
}