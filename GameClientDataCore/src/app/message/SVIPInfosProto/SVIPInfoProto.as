package app.message.SVIPInfosProto {
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
	public dynamic final class SVIPInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const QQ:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.SVIPInfosProto.SVIPInfoProto.qq", "qq", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var qq$field:String;

		public function clearQq():void {
			qq$field = null;
		}

		public function get hasQq():Boolean {
			return qq$field != null;
		}

		public function set qq(value:String):void {
			qq$field = value;
		}

		public function get qq():String {
			return qq$field;
		}

		/**
		 *  @private
		 */
		public static const URL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.SVIPInfosProto.SVIPInfoProto.url", "url", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var url$field:String;

		public function clearUrl():void {
			url$field = null;
		}

		public function get hasUrl():Boolean {
			return url$field != null;
		}

		public function set url(value:String):void {
			url$field = value;
		}

		public function get url():String {
			return url$field;
		}

		/**
		 *  @private
		 */
		public static const PICID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.SVIPInfosProto.SVIPInfoProto.picId", "picId", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var picId$field:String;

		public function clearPicId():void {
			picId$field = null;
		}

		public function get hasPicId():Boolean {
			return picId$field != null;
		}

		public function set picId(value:String):void {
			picId$field = value;
		}

		public function get picId():String {
			return picId$field;
		}

		/**
		 *  @private
		 */
		public static const RECHARGE_REQUEST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SVIPInfosProto.SVIPInfoProto.recharge_request", "rechargeRequest", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var recharge_request$field:int;

		private var hasField$0:uint = 0;

		public function clearRechargeRequest():void {
			hasField$0 &= 0xfffffffe;
			recharge_request$field = new int();
		}

		public function get hasRechargeRequest():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set rechargeRequest(value:int):void {
			hasField$0 |= 0x1;
			recharge_request$field = value;
		}

		public function get rechargeRequest():int {
			return recharge_request$field;
		}

		/**
		 *  @private
		 */
		public static const COMBINE_OPERATOR_AND_SERVERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SVIPInfosProto.SVIPInfoProto.combine_operator_and_serverid", "combineOperatorAndServerid", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var combine_operator_and_serverid$field:int;

		public function clearCombineOperatorAndServerid():void {
			hasField$0 &= 0xfffffffd;
			combine_operator_and_serverid$field = new int();
		}

		public function get hasCombineOperatorAndServerid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set combineOperatorAndServerid(value:int):void {
			hasField$0 |= 0x2;
			combine_operator_and_serverid$field = value;
		}

		public function get combineOperatorAndServerid():int {
			return combine_operator_and_serverid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasQq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, qq$field);
			}
			if (hasUrl) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, url$field);
			}
			if (hasPicId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, picId$field);
			}
			if (hasRechargeRequest) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, recharge_request$field);
			}
			if (hasCombineOperatorAndServerid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, combine_operator_and_serverid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var qq$count:uint = 0;
			var url$count:uint = 0;
			var picId$count:uint = 0;
			var recharge_request$count:uint = 0;
			var combine_operator_and_serverid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (qq$count != 0) {
						throw new flash.errors.IOError('Bad data format: SVIPInfoProto.qq cannot be set twice.');
					}
					++qq$count;
					this.qq = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (url$count != 0) {
						throw new flash.errors.IOError('Bad data format: SVIPInfoProto.url cannot be set twice.');
					}
					++url$count;
					this.url = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (picId$count != 0) {
						throw new flash.errors.IOError('Bad data format: SVIPInfoProto.picId cannot be set twice.');
					}
					++picId$count;
					this.picId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (recharge_request$count != 0) {
						throw new flash.errors.IOError('Bad data format: SVIPInfoProto.rechargeRequest cannot be set twice.');
					}
					++recharge_request$count;
					this.rechargeRequest = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (combine_operator_and_serverid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SVIPInfoProto.combineOperatorAndServerid cannot be set twice.');
					}
					++combine_operator_and_serverid$count;
					this.combineOperatorAndServerid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
