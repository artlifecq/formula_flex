package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarReliveMonDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MON_CONFIG_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDataProto.mon_config_id", "monConfigId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mon_config_id$field:int;

		private var hasField$0:uint = 0;

		public function clearMonConfigId():void {
			hasField$0 &= 0xfffffffe;
			mon_config_id$field = new int();
		}

		public function get hasMonConfigId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set monConfigId(value:int):void {
			hasField$0 |= 0x1;
			mon_config_id$field = value;
		}

		public function get monConfigId():int {
			return mon_config_id$field;
		}

		/**
		 *  @private
		 */
		public static const RELIVE_POS_PRIORITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDataProto.relive_pos_priority", "relivePosPriority", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var relive_pos_priority$field:int;

		public function clearRelivePosPriority():void {
			hasField$0 &= 0xfffffffd;
			relive_pos_priority$field = new int();
		}

		public function get hasRelivePosPriority():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set relivePosPriority(value:int):void {
			hasField$0 |= 0x2;
			relive_pos_priority$field = value;
		}

		public function get relivePosPriority():int {
			return relive_pos_priority$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCER_RELIVE_SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDataProto.defencer_relive_scene_id", "defencerReliveSceneId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var defencer_relive_scene_id$field:int;

		public function clearDefencerReliveSceneId():void {
			hasField$0 &= 0xfffffffb;
			defencer_relive_scene_id$field = new int();
		}

		public function get hasDefencerReliveSceneId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set defencerReliveSceneId(value:int):void {
			hasField$0 |= 0x4;
			defencer_relive_scene_id$field = value;
		}

		public function get defencerReliveSceneId():int {
			return defencer_relive_scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACKER_RELIVE_SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDataProto.attacker_relive_scene_id", "attackerReliveSceneId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attacker_relive_scene_id$field:int;

		public function clearAttackerReliveSceneId():void {
			hasField$0 &= 0xfffffff7;
			attacker_relive_scene_id$field = new int();
		}

		public function get hasAttackerReliveSceneId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set attackerReliveSceneId(value:int):void {
			hasField$0 |= 0x8;
			attacker_relive_scene_id$field = value;
		}

		public function get attackerReliveSceneId():int {
			return attacker_relive_scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_UNLOCK_AREA_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDataProto.dead_unlock_area_id", "deadUnlockAreaId", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_unlock_area_id$field:int;

		public function clearDeadUnlockAreaId():void {
			hasField$0 &= 0xffffffef;
			dead_unlock_area_id$field = new int();
		}

		public function get hasDeadUnlockAreaId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set deadUnlockAreaId(value:int):void {
			hasField$0 |= 0x10;
			dead_unlock_area_id$field = value;
		}

		public function get deadUnlockAreaId():int {
			return dead_unlock_area_id$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_ACCPET_ZHAN_CHE_WHEN_DEAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CountryWarReliveMonDataProto.can_accpet_zhan_che_when_dead", "canAccpetZhanCheWhenDead", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_accpet_zhan_che_when_dead$field:Boolean;

		public function clearCanAccpetZhanCheWhenDead():void {
			hasField$0 &= 0xffffffdf;
			can_accpet_zhan_che_when_dead$field = new Boolean();
		}

		public function get hasCanAccpetZhanCheWhenDead():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canAccpetZhanCheWhenDead(value:Boolean):void {
			hasField$0 |= 0x20;
			can_accpet_zhan_che_when_dead$field = value;
		}

		public function get canAccpetZhanCheWhenDead():Boolean {
			return can_accpet_zhan_che_when_dead$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMonConfigId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mon_config_id$field);
			}
			if (hasRelivePosPriority) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, relive_pos_priority$field);
			}
			if (hasDefencerReliveSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, defencer_relive_scene_id$field);
			}
			if (hasAttackerReliveSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, attacker_relive_scene_id$field);
			}
			if (hasDeadUnlockAreaId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, dead_unlock_area_id$field);
			}
			if (hasCanAccpetZhanCheWhenDead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_accpet_zhan_che_when_dead$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var mon_config_id$count:uint = 0;
			var relive_pos_priority$count:uint = 0;
			var defencer_relive_scene_id$count:uint = 0;
			var attacker_relive_scene_id$count:uint = 0;
			var dead_unlock_area_id$count:uint = 0;
			var can_accpet_zhan_che_when_dead$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mon_config_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarReliveMonDataProto.monConfigId cannot be set twice.');
					}
					++mon_config_id$count;
					this.monConfigId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (relive_pos_priority$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarReliveMonDataProto.relivePosPriority cannot be set twice.');
					}
					++relive_pos_priority$count;
					this.relivePosPriority = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (defencer_relive_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarReliveMonDataProto.defencerReliveSceneId cannot be set twice.');
					}
					++defencer_relive_scene_id$count;
					this.defencerReliveSceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (attacker_relive_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarReliveMonDataProto.attackerReliveSceneId cannot be set twice.');
					}
					++attacker_relive_scene_id$count;
					this.attackerReliveSceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (dead_unlock_area_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarReliveMonDataProto.deadUnlockAreaId cannot be set twice.');
					}
					++dead_unlock_area_id$count;
					this.deadUnlockAreaId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (can_accpet_zhan_che_when_dead$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarReliveMonDataProto.canAccpetZhanCheWhenDead cannot be set twice.');
					}
					++can_accpet_zhan_che_when_dead$count;
					this.canAccpetZhanCheWhenDead = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
