package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TaskTargetProto.UpgradeLevelTargetProto;
	import app.message.TaskTargetProto.FinishStoryDungeonTargetProto;
	import app.message.TaskTargetProto.CollectGoodsTargetProto;
	import app.message.TaskTargetProto.ClientTaskTargetProto;
	import app.message.TaskTargetProto.SearchAreaTargetProto;
	import app.message.TaskTargetProto.SentNpcTargetProto;
	import app.message.TaskTargetProto.PlayerWaitTimeTargetProto;
	import app.message.TaskTargetProto.DropGoodsTargetProto;
	import app.message.TaskTargetProto.VehiclePlayerTargetProto;
	import app.message.TaskTargetProto.DepotGoodsTargetProto;
	import app.message.TaskTargetProto.ReplyNpcTargetProto;
	import app.message.TaskTargetProto.KillMonsterTargetProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TaskTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CLIENT_EVENT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskTargetProto.client_event", "clientEvent", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client_event$field:int;

		private var hasField$0:uint = 0;

		public function clearClientEvent():void {
			hasField$0 &= 0xfffffffe;
			client_event$field = new int();
		}

		public function get hasClientEvent():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clientEvent(value:int):void {
			hasField$0 |= 0x1;
			client_event$field = value;
		}

		public function get clientEvent():int {
			return client_event$field;
		}

		/**
		 *  @private
		 */
		public static const REPLY_NPC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.reply_npc", "replyNpc", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.ReplyNpcTargetProto; });

		private var reply_npc$field:app.message.TaskTargetProto.ReplyNpcTargetProto;

		public function clearReplyNpc():void {
			reply_npc$field = null;
		}

		public function get hasReplyNpc():Boolean {
			return reply_npc$field != null;
		}

		public function set replyNpc(value:app.message.TaskTargetProto.ReplyNpcTargetProto):void {
			reply_npc$field = value;
		}

		public function get replyNpc():app.message.TaskTargetProto.ReplyNpcTargetProto {
			return reply_npc$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_MONSTER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.kill_monster", "killMonster", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.KillMonsterTargetProto; });

		private var kill_monster$field:app.message.TaskTargetProto.KillMonsterTargetProto;

		public function clearKillMonster():void {
			kill_monster$field = null;
		}

		public function get hasKillMonster():Boolean {
			return kill_monster$field != null;
		}

		public function set killMonster(value:app.message.TaskTargetProto.KillMonsterTargetProto):void {
			kill_monster$field = value;
		}

		public function get killMonster():app.message.TaskTargetProto.KillMonsterTargetProto {
			return kill_monster$field;
		}

		/**
		 *  @private
		 */
		public static const DROP_GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.drop_goods", "dropGoods", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.DropGoodsTargetProto; });

		private var drop_goods$field:app.message.TaskTargetProto.DropGoodsTargetProto;

		public function clearDropGoods():void {
			drop_goods$field = null;
		}

		public function get hasDropGoods():Boolean {
			return drop_goods$field != null;
		}

		public function set dropGoods(value:app.message.TaskTargetProto.DropGoodsTargetProto):void {
			drop_goods$field = value;
		}

		public function get dropGoods():app.message.TaskTargetProto.DropGoodsTargetProto {
			return drop_goods$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.collect_goods", "collectGoods", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.CollectGoodsTargetProto; });

		private var collect_goods$field:app.message.TaskTargetProto.CollectGoodsTargetProto;

		public function clearCollectGoods():void {
			collect_goods$field = null;
		}

		public function get hasCollectGoods():Boolean {
			return collect_goods$field != null;
		}

		public function set collectGoods(value:app.message.TaskTargetProto.CollectGoodsTargetProto):void {
			collect_goods$field = value;
		}

		public function get collectGoods():app.message.TaskTargetProto.CollectGoodsTargetProto {
			return collect_goods$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_LEVEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.upgrade_level", "upgradeLevel", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.UpgradeLevelTargetProto; });

		private var upgrade_level$field:app.message.TaskTargetProto.UpgradeLevelTargetProto;

		public function clearUpgradeLevel():void {
			upgrade_level$field = null;
		}

		public function get hasUpgradeLevel():Boolean {
			return upgrade_level$field != null;
		}

		public function set upgradeLevel(value:app.message.TaskTargetProto.UpgradeLevelTargetProto):void {
			upgrade_level$field = value;
		}

		public function get upgradeLevel():app.message.TaskTargetProto.UpgradeLevelTargetProto {
			return upgrade_level$field;
		}

		/**
		 *  @private
		 */
		public static const DEPOT_GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.depot_goods", "depotGoods", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.DepotGoodsTargetProto; });

		private var depot_goods$field:app.message.TaskTargetProto.DepotGoodsTargetProto;

		public function clearDepotGoods():void {
			depot_goods$field = null;
		}

		public function get hasDepotGoods():Boolean {
			return depot_goods$field != null;
		}

		public function set depotGoods(value:app.message.TaskTargetProto.DepotGoodsTargetProto):void {
			depot_goods$field = value;
		}

		public function get depotGoods():app.message.TaskTargetProto.DepotGoodsTargetProto {
			return depot_goods$field;
		}

		/**
		 *  @private
		 */
		public static const SEARCH_AREA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.search_area", "searchArea", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.SearchAreaTargetProto; });

		private var search_area$field:app.message.TaskTargetProto.SearchAreaTargetProto;

		public function clearSearchArea():void {
			search_area$field = null;
		}

		public function get hasSearchArea():Boolean {
			return search_area$field != null;
		}

		public function set searchArea(value:app.message.TaskTargetProto.SearchAreaTargetProto):void {
			search_area$field = value;
		}

		public function get searchArea():app.message.TaskTargetProto.SearchAreaTargetProto {
			return search_area$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.client_task", "clientTask", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.ClientTaskTargetProto; });

		private var client_task$field:app.message.TaskTargetProto.ClientTaskTargetProto;

		public function clearClientTask():void {
			client_task$field = null;
		}

		public function get hasClientTask():Boolean {
			return client_task$field != null;
		}

		public function set clientTask(value:app.message.TaskTargetProto.ClientTaskTargetProto):void {
			client_task$field = value;
		}

		public function get clientTask():app.message.TaskTargetProto.ClientTaskTargetProto {
			return client_task$field;
		}

		/**
		 *  @private
		 */
		public static const PLAYER_WAIT_TIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.player_wait_time", "playerWaitTime", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.PlayerWaitTimeTargetProto; });

		private var player_wait_time$field:app.message.TaskTargetProto.PlayerWaitTimeTargetProto;

		public function clearPlayerWaitTime():void {
			player_wait_time$field = null;
		}

		public function get hasPlayerWaitTime():Boolean {
			return player_wait_time$field != null;
		}

		public function set playerWaitTime(value:app.message.TaskTargetProto.PlayerWaitTimeTargetProto):void {
			player_wait_time$field = value;
		}

		public function get playerWaitTime():app.message.TaskTargetProto.PlayerWaitTimeTargetProto {
			return player_wait_time$field;
		}

		/**
		 *  @private
		 */
		public static const SENT_NPC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.sent_npc", "sentNpc", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.SentNpcTargetProto; });

		private var sent_npc$field:app.message.TaskTargetProto.SentNpcTargetProto;

		public function clearSentNpc():void {
			sent_npc$field = null;
		}

		public function get hasSentNpc():Boolean {
			return sent_npc$field != null;
		}

		public function set sentNpc(value:app.message.TaskTargetProto.SentNpcTargetProto):void {
			sent_npc$field = value;
		}

		public function get sentNpc():app.message.TaskTargetProto.SentNpcTargetProto {
			return sent_npc$field;
		}

		/**
		 *  @private
		 */
		public static const VEHICLE_PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.vehicle_player", "vehiclePlayer", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.VehiclePlayerTargetProto; });

		private var vehicle_player$field:app.message.TaskTargetProto.VehiclePlayerTargetProto;

		public function clearVehiclePlayer():void {
			vehicle_player$field = null;
		}

		public function get hasVehiclePlayer():Boolean {
			return vehicle_player$field != null;
		}

		public function set vehiclePlayer(value:app.message.TaskTargetProto.VehiclePlayerTargetProto):void {
			vehicle_player$field = value;
		}

		public function get vehiclePlayer():app.message.TaskTargetProto.VehiclePlayerTargetProto {
			return vehicle_player$field;
		}

		/**
		 *  @private
		 */
		public static const FINISH_STORY_DUNGEON:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskTargetProto.finish_story_dungeon", "finishStoryDungeon", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto.FinishStoryDungeonTargetProto; });

		private var finish_story_dungeon$field:app.message.TaskTargetProto.FinishStoryDungeonTargetProto;

		public function clearFinishStoryDungeon():void {
			finish_story_dungeon$field = null;
		}

		public function get hasFinishStoryDungeon():Boolean {
			return finish_story_dungeon$field != null;
		}

		public function set finishStoryDungeon(value:app.message.TaskTargetProto.FinishStoryDungeonTargetProto):void {
			finish_story_dungeon$field = value;
		}

		public function get finishStoryDungeon():app.message.TaskTargetProto.FinishStoryDungeonTargetProto {
			return finish_story_dungeon$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasClientEvent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, client_event$field);
			}
			if (hasReplyNpc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, reply_npc$field);
			}
			if (hasKillMonster) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kill_monster$field);
			}
			if (hasDropGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, drop_goods$field);
			}
			if (hasCollectGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, collect_goods$field);
			}
			if (hasUpgradeLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, upgrade_level$field);
			}
			if (hasDepotGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, depot_goods$field);
			}
			if (hasSearchArea) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, search_area$field);
			}
			if (hasClientTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, client_task$field);
			}
			if (hasPlayerWaitTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, player_wait_time$field);
			}
			if (hasSentNpc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, sent_npc$field);
			}
			if (hasVehiclePlayer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, vehicle_player$field);
			}
			if (hasFinishStoryDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, finish_story_dungeon$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var client_event$count:uint = 0;
			var reply_npc$count:uint = 0;
			var kill_monster$count:uint = 0;
			var drop_goods$count:uint = 0;
			var collect_goods$count:uint = 0;
			var upgrade_level$count:uint = 0;
			var depot_goods$count:uint = 0;
			var search_area$count:uint = 0;
			var client_task$count:uint = 0;
			var player_wait_time$count:uint = 0;
			var sent_npc$count:uint = 0;
			var vehicle_player$count:uint = 0;
			var finish_story_dungeon$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (client_event$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.clientEvent cannot be set twice.');
					}
					++client_event$count;
					this.clientEvent = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (reply_npc$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.replyNpc cannot be set twice.');
					}
					++reply_npc$count;
					this.replyNpc = new app.message.TaskTargetProto.ReplyNpcTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.replyNpc);
					break;
				case 6:
					if (kill_monster$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.killMonster cannot be set twice.');
					}
					++kill_monster$count;
					this.killMonster = new app.message.TaskTargetProto.KillMonsterTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.killMonster);
					break;
				case 7:
					if (drop_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.dropGoods cannot be set twice.');
					}
					++drop_goods$count;
					this.dropGoods = new app.message.TaskTargetProto.DropGoodsTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.dropGoods);
					break;
				case 8:
					if (collect_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.collectGoods cannot be set twice.');
					}
					++collect_goods$count;
					this.collectGoods = new app.message.TaskTargetProto.CollectGoodsTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.collectGoods);
					break;
				case 9:
					if (upgrade_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.upgradeLevel cannot be set twice.');
					}
					++upgrade_level$count;
					this.upgradeLevel = new app.message.TaskTargetProto.UpgradeLevelTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.upgradeLevel);
					break;
				case 10:
					if (depot_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.depotGoods cannot be set twice.');
					}
					++depot_goods$count;
					this.depotGoods = new app.message.TaskTargetProto.DepotGoodsTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.depotGoods);
					break;
				case 11:
					if (search_area$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.searchArea cannot be set twice.');
					}
					++search_area$count;
					this.searchArea = new app.message.TaskTargetProto.SearchAreaTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.searchArea);
					break;
				case 12:
					if (client_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.clientTask cannot be set twice.');
					}
					++client_task$count;
					this.clientTask = new app.message.TaskTargetProto.ClientTaskTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.clientTask);
					break;
				case 13:
					if (player_wait_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.playerWaitTime cannot be set twice.');
					}
					++player_wait_time$count;
					this.playerWaitTime = new app.message.TaskTargetProto.PlayerWaitTimeTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.playerWaitTime);
					break;
				case 14:
					if (sent_npc$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.sentNpc cannot be set twice.');
					}
					++sent_npc$count;
					this.sentNpc = new app.message.TaskTargetProto.SentNpcTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sentNpc);
					break;
				case 15:
					if (vehicle_player$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.vehiclePlayer cannot be set twice.');
					}
					++vehicle_player$count;
					this.vehiclePlayer = new app.message.TaskTargetProto.VehiclePlayerTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.vehiclePlayer);
					break;
				case 16:
					if (finish_story_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskTargetProto.finishStoryDungeon cannot be set twice.');
					}
					++finish_story_dungeon$count;
					this.finishStoryDungeon = new app.message.TaskTargetProto.FinishStoryDungeonTargetProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.finishStoryDungeon);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
