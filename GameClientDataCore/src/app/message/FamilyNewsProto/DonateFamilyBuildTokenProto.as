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
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DonateFamilyBuildTokenProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DONATE_TOKEN_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.DonateFamilyBuildTokenProto.donate_token_member", "donateTokenMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var donate_token_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearDonateTokenMember():void {
			donate_token_member$field = null;
		}

		public function get hasDonateTokenMember():Boolean {
			return donate_token_member$field != null;
		}

		public function set donateTokenMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			donate_token_member$field = value;
		}

		public function get donateTokenMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return donate_token_member$field;
		}

		/**
		 *  @private
		 */
		public static const TOKEN_COUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyNewsProto.DonateFamilyBuildTokenProto.token_count", "tokenCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var token_count$field:Int64;

		public function clearTokenCount():void {
			token_count$field = null;
		}

		public function get hasTokenCount():Boolean {
			return token_count$field != null;
		}

		public function set tokenCount(value:Int64):void {
			token_count$field = value;
		}

		public function get tokenCount():Int64 {
			return token_count$field;
		}

		/**
		 *  @private
		 */
		public static const CONTRIBUTION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyNewsProto.DonateFamilyBuildTokenProto.contribution", "contribution", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var contribution$field:int;

		private var hasField$0:uint = 0;

		public function clearContribution():void {
			hasField$0 &= 0xfffffffe;
			contribution$field = new int();
		}

		public function get hasContribution():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set contribution(value:int):void {
			hasField$0 |= 0x1;
			contribution$field = value;
		}

		public function get contribution():int {
			return contribution$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDonateTokenMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, donate_token_member$field);
			}
			if (hasTokenCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, token_count$field);
			}
			if (hasContribution) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, contribution$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var donate_token_member$count:uint = 0;
			var token_count$count:uint = 0;
			var contribution$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (donate_token_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateFamilyBuildTokenProto.donateTokenMember cannot be set twice.');
					}
					++donate_token_member$count;
					this.donateTokenMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.donateTokenMember);
					break;
				case 2:
					if (token_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateFamilyBuildTokenProto.tokenCount cannot be set twice.');
					}
					++token_count$count;
					this.tokenCount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (contribution$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateFamilyBuildTokenProto.contribution cannot be set twice.');
					}
					++contribution$count;
					this.contribution = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
