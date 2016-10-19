package app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto {
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
	public dynamic final class NpcTransportProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto.country", "country", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SCENE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto.scene", "scene", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene$field:int;

		public function clearScene():void {
			hasField$0 &= 0xfffffffd;
			scene$field = new int();
		}

		public function get hasScene():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set scene(value:int):void {
			hasField$0 |= 0x2;
			scene$field = value;
		}

		public function get scene():int {
			return scene$field;
		}

		/**
		 *  @private
		 */
		public static const COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto.cost", "cost", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost$field:int;

		public function clearCost():void {
			hasField$0 &= 0xfffffffb;
			cost$field = new int();
		}

		public function get hasCost():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set cost(value:int):void {
			hasField$0 |= 0x4;
			cost$field = value;
		}

		public function get cost():int {
			return cost$field;
		}

		/**
		 *  @private
		 */
		public static const POS_DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto.pos_desc", "posDesc", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pos_desc$field:String;

		public function clearPosDesc():void {
			pos_desc$field = null;
		}

		public function get hasPosDesc():Boolean {
			return pos_desc$field != null;
		}

		public function set posDesc(value:String):void {
			pos_desc$field = value;
		}

		public function get posDesc():String {
			return pos_desc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			if (hasScene) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene$field);
			}
			if (hasCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cost$field);
			}
			if (hasPosDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pos_desc$field);
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
			var scene$count:uint = 0;
			var cost$count:uint = 0;
			var pos_desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcTransportProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (scene$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcTransportProto.scene cannot be set twice.');
					}
					++scene$count;
					this.scene = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcTransportProto.cost cannot be set twice.');
					}
					++cost$count;
					this.cost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (pos_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcTransportProto.posDesc cannot be set twice.');
					}
					++pos_desc$count;
					this.posDesc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
