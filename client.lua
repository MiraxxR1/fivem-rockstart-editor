local String = {
	{
		name = "start_recording",
		description = "Start recording",
		key = "F1",
		action = function()
			if not IsRecording() then
				StartRecording(1)
				print("Starting recording!")
			else
				print("You are already recording!")
			end
		end,
	},
	{
		name = "open_rockstar_editor",
		description = "Open rockstart editor",
		key = "F2",
		action = function()
			if not IsRecording() then
				ActivateRockstarEditor()
			else
				print("You are recording, stop your recording first")
			end
		end,
	},
	{
		name = "stop_record_save",
		description = "Stop recording and save",
		key = "F3",
		action = function()
			if IsRecording() then
				StopRecordingAndSaveClip()
				print("Stop recording and save !")
			else
				print("You are not recording!")
			end
		end,
	},
	{
		name = "stop_record_discard",
		description = "Stop recording and Discard",
		key = "F4",
		action = function()
			if IsRecording() then
				StopRecordingAndDiscardClip()
				print("Stop recording and Discard !")
			else
				print("You are not recording!")
			end
		end,
	},
}

Citizen.CreateThread(function()
	for index, data in pairs(String) do
		RegisterKeyMapping(data.name, data.description, "keyboard", data.key)
		RegisterCommand(data.name, function()
			data.action()
		end, false)
	end
end)
