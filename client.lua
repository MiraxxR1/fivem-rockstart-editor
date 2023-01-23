--[[
	String.state =
		Simple 
		Complete
]]
--

local String = {
	state = "Simple",
	data = {
		{
			name = "start_recording",
			description = "Start recording",
			key = "F1",
			action = function()
				if not IsRecording() then
					StartRecording(1)
				end
			end,
		},
		{
			name = "open_rockstar_editor",
			description = "Open rockstart editor",
			key = "F2",
			action = function()
				if not IsRecording() then
					NetworkSessionLeaveSinglePlayer()
					ActivateRockstarEditor()
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
				end
			end,
		},
	},
	data2 = {
		{
			name = "start_recording_and_save",
			description = "Start recording and save",
			key = "F1",
			action = function()
				if IsRecording() then
					StopRecordingAndSaveClip()
				else
					StartRecording(1)
				end
			end,
		},
		{
			name = "open_rockstar_editor",
			description = "Open rockstart editor",
			key = "F2",
			action = function()
				if not IsRecording() then
					NetworkSessionLeaveSinglePlayer()
					ActivateRockstarEditor()
				end
			end,
		},
	},
}

Citizen.CreateThread(function()
	if String.state == "Simple" then
		for index, data in pairs(String.data2) do
			RegisterKeyMapping(data.name, data.description, "keyboard", data.key)
			RegisterCommand(data.name, function()
				data.action()
			end, false)
		end
	elseif String.state == "Complete" then
		for index, data in pairs(String.data) do
			RegisterKeyMapping(data.name, data.description, "keyboard", data.key)
			RegisterCommand(data.name, function()
				data.action()
			end, false)
		end
	end
end)
