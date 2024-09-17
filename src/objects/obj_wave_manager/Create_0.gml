timer = 0
wave_interval = 360;  
yumi_quest_count = 0
wave_mappings = [
    {time: 20, enemies: [obj_slippery_slime,obj_slippery_slime,obj_slippery_slime]},
    {time: 40, enemies: [obj_slippery_slime, obj_crab, obj_crab, obj_crab]},
    {time: 60, enemies: [obj_crab, obj_fiendish_flower,obj_fiendish_flower,obj_fiendish_flower]},
    {time: 80, enemies: [obj_fiendish_flower, obj_mimic, obj_mimic, obj_mimic]},
	{time: 100, enemies: [obj_mimic, obj_bat, obj_bat, obj_bat]},
    {time: 120, enemies: [obj_bat, obj_mushroom, obj_mushroom, obj_mushroom]},
	{time: 140, enemies: [obj_mushroom,obj_bird, obj_bird, obj_bird]},
	{time: 160, enemies: [obj_bird, obj_wasp, obj_wasp, obj_wasp]},
	{time: 180, enemies: [obj_bird, obj_wasp, obj_mushroom, obj_bird, obj_wasp, obj_mushroom]},
   
];
boss_spawned = false
spawner_count = instance_number(obj_spawner);
spawners = []
for (var _i = 0; _i < spawner_count; _i++) {
    var _spawner_instance = instance_find(obj_spawner, _i);
    array_push(spawners, _spawner_instance);
}
yumi_quest_message = false