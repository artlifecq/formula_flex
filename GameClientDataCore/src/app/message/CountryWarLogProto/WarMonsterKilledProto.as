package app.message.CountryWarLogProto {
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
	public dynamic final class WarMonsterKilledProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarLogProto.WarMonsterKilledProto.country", "country", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		private var hasField$0:uint = 0;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffe;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x1;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const MONSTER_CONFIG_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarLogProto.WarMonsterKilledProto.monster_config_id", "monsterConfigId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var monster_config_id$field:int;

		public function clearMonsterConfigId():void {
			hasField$0 &= 0xfffffffd;
			monster_config_id$field = new int();
		}

		public function get hasMonsterConfigId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set monsterConfigId(value:int):void {
			hasField$0 |= 0x2;
			monster_config_id$field = value;
		}

		public function get monsterConfigId():int {
			return monster_config_id$field;
		}

		/**
		 *  @private
		 */
		public static const KILLER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryWarLogProto.WarMonsterKilledProto.killer_name", "killerName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var killer_name$field:String;

		public function clearKillerName():void {
			killer_name$field = null;
		}

		public function get hasKillerName():Boolean {
			return killer_name$field != null;
		}

		public function set killerName(value:String):void {
			killer_name$field = value;
		}

		public function get killerName():String {
			return killer_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			if (hasMonsterConfigId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, monster_config_id$field);
			}
			if (hasKillerName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, killer_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var country$count:uint = 0;
			var monster_config_id$count:uint = 0;
			var killer_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: WarMonsterKilledProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (monster_config_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: WarMonsterKilledProto.monsterConfigId cannot be set twice.');
					}
					++monster_config_id$count;
					this.monsterConfigId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (killer_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: WarMonsterKilledProto.killerName cannot be set twice.');
					}
					++killer_name$count;
					this.killerName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
