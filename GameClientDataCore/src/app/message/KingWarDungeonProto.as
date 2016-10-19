package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SquareAreaProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class KingWarDungeonProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RELIVE_CD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.KingWarDungeonProto.relive_cd", "reliveCd", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var relive_cd$field:Int64;

		public function clearReliveCd():void {
			relive_cd$field = null;
		}

		public function get hasReliveCd():Boolean {
			return relive_cd$field != null;
		}

		public function set reliveCd(value:Int64):void {
			relive_cd$field = value;
		}

		public function get reliveCd():Int64 {
			return relive_cd$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACKER_BORN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.KingWarDungeonProto.attacker_born", "attackerBorn", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SquareAreaProto; });

		private var attacker_born$field:app.message.SquareAreaProto;

		public function clearAttackerBorn():void {
			attacker_born$field = null;
		}

		public function get hasAttackerBorn():Boolean {
			return attacker_born$field != null;
		}

		public function set attackerBorn(value:app.message.SquareAreaProto):void {
			attacker_born$field = value;
		}

		public function get attackerBorn():app.message.SquareAreaProto {
			return attacker_born$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENER_BORN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.KingWarDungeonProto.defener_born", "defenerBorn", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SquareAreaProto; });

		private var defener_born$field:app.message.SquareAreaProto;

		public function clearDefenerBorn():void {
			defener_born$field = null;
		}

		public function get hasDefenerBorn():Boolean {
			return defener_born$field != null;
		}

		public function set defenerBorn(value:app.message.SquareAreaProto):void {
			defener_born$field = value;
		}

		public function get defenerBorn():app.message.SquareAreaProto {
			return defener_born$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasReliveCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, relive_cd$field);
			}
			if (hasAttackerBorn) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, attacker_born$field);
			}
			if (hasDefenerBorn) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, defener_born$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var relive_cd$count:uint = 0;
			var attacker_born$count:uint = 0;
			var defener_born$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (relive_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarDungeonProto.reliveCd cannot be set twice.');
					}
					++relive_cd$count;
					this.reliveCd = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (attacker_born$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarDungeonProto.attackerBorn cannot be set twice.');
					}
					++attacker_born$count;
					this.attackerBorn = new app.message.SquareAreaProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.attackerBorn);
					break;
				case 3:
					if (defener_born$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarDungeonProto.defenerBorn cannot be set twice.');
					}
					++defener_born$count;
					this.defenerBorn = new app.message.SquareAreaProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.defenerBorn);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
