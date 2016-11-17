package app.message.FamilyNewsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyNewsProto.MemberIdAndNameProto;
	import app.message.FamilyOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class KickMemberProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KICKER_POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.FamilyNewsProto.KickMemberProto.kicker_pos", "kickerPos", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FamilyOfficerPos);

		private var kicker_pos$field:int;

		private var hasField$0:uint = 0;

		public function clearKickerPos():void {
			hasField$0 &= 0xfffffffe;
			kicker_pos$field = new int();
		}

		public function get hasKickerPos():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set kickerPos(value:int):void {
			hasField$0 |= 0x1;
			kicker_pos$field = value;
		}

		public function get kickerPos():int {
			return kicker_pos$field;
		}

		/**
		 *  @private
		 */
		public static const KICKER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.KickMemberProto.kicker", "kicker", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var kicker$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearKicker():void {
			kicker$field = null;
		}

		public function get hasKicker():Boolean {
			return kicker$field != null;
		}

		public function set kicker(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			kicker$field = value;
		}

		public function get kicker():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return kicker$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_KICK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.KickMemberProto.been_kick", "beenKick", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var been_kick$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearBeenKick():void {
			been_kick$field = null;
		}

		public function get hasBeenKick():Boolean {
			return been_kick$field != null;
		}

		public function set beenKick(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			been_kick$field = value;
		}

		public function get beenKick():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return been_kick$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKickerPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, kicker_pos$field);
			}
			if (hasKicker) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, kicker$field);
			}
			if (hasBeenKick) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, been_kick$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var kicker_pos$count:uint = 0;
			var kicker$count:uint = 0;
			var been_kick$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (kicker_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: KickMemberProto.kickerPos cannot be set twice.');
					}
					++kicker_pos$count;
					this.kickerPos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (kicker$count != 0) {
						throw new flash.errors.IOError('Bad data format: KickMemberProto.kicker cannot be set twice.');
					}
					++kicker$count;
					this.kicker = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.kicker);
					break;
				case 3:
					if (been_kick$count != 0) {
						throw new flash.errors.IOError('Bad data format: KickMemberProto.beenKick cannot be set twice.');
					}
					++been_kick$count;
					this.beenKick = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.beenKick);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
