/// @description Insert description here


#macro ITEMS_LIST global.items_list

try{
	global.hovering_toolbox = false;
	global.items_list = {
		HOE: "hoe",
		CAN: "can",
		SCYTHE: "scythe",
		PUMPKIN_SEED: "pumpkin_seed",
		PUMPKIN: "pumpkin",
		POTATO_SEED: "potato_seed",
		POTATO: "potato",
		CARROT_SEED: "carrot_seed",
		CARROT: "carrot",
		TOMATO_SEED: "tomato_seed",
		TOMATO: "tomato",
		POD_SEED: "pod_seed",
		POD: "pod",
		
		FLOWER_1: "flower_1",
		FLOWER_2: "flower_2",
		FLOWER_3: "flower_3",
		FENCE_CORNER_LEFT: "fence_corner_left",
		FENCE_CORNER_RIGHT: "fence_corner_right",
		FENCE_LEFT: "fence_left",
		FENCE_RIGHT: "fence_right",
		FENCE_UP: "fence_up",
		FENCE_MIDDLE_LEFT: "fence_middle_left",
		FENCE_MIDDLE_RIGHT: "fence_middle_right",
	}
	global.ITEMS = ds_map_create();
	global.ITEMS[? "hoe"] = {name: "hoe", thumbnail: spr_toolbox_hoe, spr: spr_toolbox_hoe, price: 0, sellable: false, equipable: true, decor: false}
	global.ITEMS[? "can"] = {name: "can", thumbnail: spr_toolbox_can, spr: spr_toolbox_can, price: 0, sellable: false, equipable: true, decor: false}
	global.ITEMS[? "scythe"] = {name: "scythe", thumbnail: spr_toolbox_scythe, spr: spr_toolbox_scythe, price: 0, sellable: false, equipable: true, decor: false}
	
	global.ITEMS[? "pumpkin_seed"] = {name: "pumpkin_seed", thumbnail: spr_toolbox_pumpkin_seed, spr: spr_toolbox_pumpkin_seed, price: 50, sellable: true, equipable: true, decor: false}
	global.ITEMS[? "pumpkin"] = {name: "pumpkin", thumbnail: spr_toolbox_pumpkin, spr: spr_toolbox_pumpkin, price: 150, sellable: true, equipable: false, decor: false}
	global.ITEMS[? "potato_seed"] = {name: "potato_seed", thumbnail: spr_toolbox_potato_seed, spr: spr_toolbox_potato_seed, price: 20, sellable: true, equipable: true, decor: false}
	global.ITEMS[? "potato"] = {name: "potato", thumbnail: spr_toolbox_potato, spr: spr_toolbox_potato, price: 60, sellable: true, equipable: false, decor: false}
	global.ITEMS[? "carrot_seed"] = {name: "carrot_seed", thumbnail: spr_toolbox_carrot_seed, spr: spr_toolbox_carrot_seed, price: 10, sellable: true, equipable: true, decor: false}
	global.ITEMS[? "carrot"] = {name: "carrot", thumbnail: spr_toolbox_carrot, spr: spr_toolbox_carrot, price: 30, sellable: true, equipable: false, decor: false}
	global.ITEMS[? "tomato_seed"] = {name: "tomato_seed",thumbnail: spr_toolbox_tomato_seed,  spr: spr_toolbox_tomato_seed, price: 5, sellable: true, equipable: true, decor: false}
	global.ITEMS[? "tomato"] = {name: "tomato", thumbnail: spr_toolbox_tomato, spr: spr_toolbox_tomato, price: 15, sellable: true, equipable: false, decor: false}
	global.ITEMS[? "pod_seed"] = {name: "pod_seed", thumbnail: spr_toolbox_pod_seed, spr: spr_toolbox_pod_seed, price: 5, sellable: true, equipable: true, decor: false}
	global.ITEMS[? "pod"] = {name: "pod", thumbnail: spr_toolbox_pod, spr: spr_toolbox_pod, price: 15, sellable: true, equipable: false, decor: false}
	
	global.ITEMS[? "flower_1"] = {name: "flower_1", thumbnail: spr_toolbox_flower_1, spr: spr_world_decor_flower_1, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "flower_2"] = {name: "flower_2", thumbnail: spr_toolbox_flower_2, spr: spr_world_decor_flower_2, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "flower_3"] = {name: "flower_3", thumbnail: spr_toolbox_flower_3, spr: spr_world_decor_flower_3, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_corner_left"] = {name: "fence_corner_left", thumbnail: spr_toolbox_fence_corner_left, spr: spr_world_decor_fence_corner_left, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_corner_right"] = {name: "fence_corner_right", thumbnail: spr_toolbox_fence_corner_right, spr: spr_world_decor_fence_corner_right, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_left"] = {name: "fence_left", thumbnail: spr_toolbox_fence_left, spr: spr_world_decor_fence_left, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_middle_left"] = {name: "fence_middle_left", thumbnail: spr_toolbox_fence_middle_left, spr: spr_world_decor_fence_middle_left, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_middle_right"] = {name: "fence_middle_right", thumbnail: spr_toolbox_fence_middle_right, spr: spr_world_decor_fence_middle_right, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_right"] = {name: "fence_right", thumbnail: spr_toolbox_fence_right, spr: spr_world_decor_fence_right, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_up_left"] = {name: "fence_up_left", thumbnail: spr_toolbox_fence_up_left, spr: spr_world_decor_fence_up_left, price: 10, sellable: true, equipable: true, decor: true}
	global.ITEMS[? "fence_up_right"] = {name: "fence_up_right", thumbnail: spr_toolbox_fence_up_right, spr: spr_world_decor_fence_up_right, price: 10, sellable: true, equipable: true, decor: true}
	
	inventory = [];
	inventory_limit = 14;
	money = 0;
	hovering_item = noone;
	
	__GetItemIndex = function(_item){
		var _leng = array_length(inventory);
		for(var _i = 0; _i < _leng; ++_i){
			var _current = inventory[_i];
			if(_current.name == _item){
				return _i;
			}
		}
		return noone;
	}
	AddItem = function(_item, _amt){
		var _idx = __GetItemIndex(_item);
		if(_idx == noone){
			if(array_length(inventory) >= inventory_limit){
				return false;	
			}
			array_push(inventory, {
				name: _item,
				amt: _amt,
				equiped: false
			});
			return true;
		}
		inventory[_idx].amt += _amt;
		return true;
	}
	SubtItem = function(_item, _amt){
		var _idx = __GetItemIndex(_item);
		if(_idx == noone){
			return false;	
		}
		var _current = inventory[_idx];
		if(_current.amt < _amt){
			return false;	
		}
		_current.amt -= _amt;
		if(_current.amt == 0){
			array_delete(inventory, _idx, 1);
		}
		return true;
	}
	EquipItem = function(_item){
		if(!GetItem(_item).equipable){
			return false;	
		}
		var _idx = __GetItemIndex(_item);
		if(_idx == noone){
			return false;	
		}
		var _leng = array_length(inventory);
		for(var _i = 0; _i < _leng; ++_i){
			inventory[_i].equiped = false;
		}
		inventory[_idx].equiped = true;
		return true;
	}
	GetItem = function(_item){
		return global.ITEMS[? _item];
	}
	GetEquipedItem = function(){
		var _leng = array_length(inventory);
		for(var _i = 0; _i < _leng; ++_i){
			var _current = inventory[_i];
			if(_current.equiped){
				return _current.name;
			}
		}
		return noone;
	}
	AddMoney = function(_amt){
		money += _amt;
	}
	SubtMoney = function(_amt){
		money = fn_clamp_min(money-_amt, 0);	
	}
	SellCurrentItem = function(){
		if(hovering_item == noone){
			return;
		}
		var _current = inventory[hovering_item];
		var _item = GetItem(_current.name);
		if(!_item.sellable){
			return;
		}
		var _amt = _current.amt;
		SubtItem(_current.name, _current.amt);
		AddMoney(_amt*_item.price);
		hovering_item = noone;
		fn_play_sound(snd_coins);
	}
	BuyItem = function(_name){
		var _item = GetItem(_name);
		if(money < _item.price){
			return false;	
		}
		if(AddItem(_name, 1)){
			SubtMoney(_item.price);
			fn_play_sound(snd_coins);
		}
	}
	
	AddItem(ITEMS_LIST.HOE, 1);
	AddItem(ITEMS_LIST.CAN, 1);
	AddItem(ITEMS_LIST.SCYTHE, 1);
	AddMoney(100);
}
catch(_err){
    fn_crash_handle(_err);
}












