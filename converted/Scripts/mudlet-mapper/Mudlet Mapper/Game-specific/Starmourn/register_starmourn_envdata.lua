function register_starmourn_envdata(_, game)
  if game ~= "Starmourn" then
    return
  end
  mmp.envids =
    {
      ["airlock"] = 55,
      ["alleyway"] = 47,
      ["armory"] = 82,
      ["badlands"] = 45,
      ["barracks"] = 77,
      ["bathroom"] = 71,
      ["beach"] = 51,
      ["bedroom"] = 66,
      ["bridge"] = 18,
      ["building"] = 5,
      ["campsite"] = 65,
      ["canal"] = 85,
      ["cantina"] = 62,
      ["canyon"] = 31,
      ["cargo bay"] = 13,
      ["catwalk"] = 23,
      ["cave"] = 37,
      ["commandpost"] = 80,
      ["corral"] = 34,
      ["deep space"] = 11,
      ["desert"] = 7,
      ["duct"] = 22,
      ["engine room"] = 44,
      ["factory"] = 32,
      ["farmland"] = 28,
      ["firingrange"] = 83,
      ["forest"] = 8,
      ["garden"] = 12,
      ["gym"] = 60,
      ["hallway"] = 58,
      ["hangar"] = 26,
      ["hangar"] = 79,
      ["hydroponics"] = 61,
      ["icyforest"] = 52,
      ["jungle"] = 19,
      ["junkyard"] = 48,
      ["lake"] = 49,
      ["lava fields"] = 56,
      ["lava"] = 57,
      ["meadow"] = 30,
      ["medical facility"] = 17,
      ["medical facility"] = 27,
      ["messhall"] = 78,
      ["militarybase"] = 76,
      ["militaryroad"] = 81,
      ["mine"] = 3,
      ["mountain"] = 1,
      ["obstaclecourse"] = 84,
      ["ocean"] = 6,
      ["office"] = 15,
      ["pier/dock"] = 38,
      ["pond"] = 64,
      ["pool"] = 14,
      ["prison"] = 59,
      ["residence"] = 63,
      ["river"] = 50,
      ["road"] = 29,
      ["ruin"] = 42,
      ["sewer"] = 40,
      ["shop"] = 67,
      ["slum"] = 69,
      ["slumbuilding"] = 73,
      ["slumstreet"] = 70,
      ["slumtoilet"] = 72,
      ["spacecraft"] = 9,
      ["spaceport"] = 39,
      ["stateroom"] = 43,
      ["stream"] = 35,
      ["street"] = 2,
      ["swamp"] = 20,
      ["temple"] = 54,
      ["transport"] = 16,
      ["treehouse"] = 36,
      ["treetops"] = 53,
      ["tundra"] = 10,
      ["underground"] = 86,
      ["underwater"] = 87,
      ["urban"] = 4,
      ["urbanunderground"] = 46,
      ["ventilation shaft"] = 21,
      ["verdantcliffs"] = 75,
    }
  mmp.waterenvs = {}
  mmp.envidsr = {}
  for name, id in pairs(mmp.envids) do
    mmp.envidsr[id] = name
  end
end
