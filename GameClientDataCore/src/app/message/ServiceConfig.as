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
	public dynamic final class ServiceConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START_SERVICE_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ServiceConfig.start_service_time", "startServiceTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_service_time$field:int;

		private var hasField$0:uint = 0;

		public function clearStartServiceTime():void {
			hasField$0 &= 0xfffffffe;
			start_service_time$field = new int();
		}

		public function get hasStartServiceTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set startServiceTime(value:int):void {
			hasField$0 |= 0x1;
			start_service_time$field = value;
		}

		public function get startServiceTime():int {
			return start_service_time$field;
		}

		/**
		 *  @private
		 */
		public static const SERVER_LINKED_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ServiceConfig.server_linked_time", "serverLinkedTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var server_linked_time$field:int;

		public function clearServerLinkedTime():void {
			hasField$0 &= 0xfffffffd;
			server_linked_time$field = new int();
		}

		public function get hasServerLinkedTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set serverLinkedTime(value:int):void {
			hasField$0 |= 0x2;
			server_linked_time$field = value;
		}

		public function get serverLinkedTime():int {
			return server_linked_time$field;
		}

		/**
		 *  @private
		 */
		public static const UNION_SERVER_CONFIG:RepeatedFieldDescriptor_TYPE_STRING = new RepeatedFieldDescriptor_TYPE_STRING("app.message.ServiceConfig.union_server_config", "unionServerConfig", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var unionServerConfig:Array = [];

		/**
		 *  @private
		 */
		public static const BATTLE_START_REGULAR_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ServiceConfig.battle_start_regular_time", "battleStartRegularTime", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var battle_start_regular_time$field:int;

		public function clearBattleStartRegularTime():void {
			hasField$0 &= 0xfffffffb;
			battle_start_regular_time$field = new int();
		}

		public function get hasBattleStartRegularTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set battleStartRegularTime(value:int):void {
			hasField$0 |= 0x4;
			battle_start_regular_time$field = value;
		}

		public function get battleStartRegularTime():int {
			return battle_start_regular_time$field;
		}

		/**
		 *  @private
		 */
		public static const UNION_SERVICE_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ServiceConfig.union_service_time", "unionServiceTime", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var union_service_time$field:int;

		public function clearUnionServiceTime():void {
			hasField$0 &= 0xfffffff7;
			union_service_time$field = new int();
		}

		public function get hasUnionServiceTime():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set unionServiceTime(value:int):void {
			hasField$0 |= 0x8;
			union_service_time$field = value;
		}

		public function get unionServiceTime():int {
			return union_service_time$field;
		}

		/**
		 *  @private
		 */
		public static const INTERCONNECTED_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ServiceConfig.interconnected_time", "interconnectedTime", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var interconnected_time$field:int;

		public function clearInterconnectedTime():void {
			hasField$0 &= 0xffffffef;
			interconnected_time$field = new int();
		}

		public function get hasInterconnectedTime():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set interconnectedTime(value:int):void {
			hasField$0 |= 0x10;
			interconnected_time$field = value;
		}

		public function get interconnectedTime():int {
			return interconnected_time$field;
		}

		/**
		 *  @private
		 */
		public static const IS_DEBUG:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.ServiceConfig.is_debug", "isDebug", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_debug$field:Boolean;

		public function clearIsDebug():void {
			hasField$0 &= 0xffffffdf;
			is_debug$field = new Boolean();
		}

		public function get hasIsDebug():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isDebug(value:Boolean):void {
			hasField$0 |= 0x20;
			is_debug$field = value;
		}

		public function get isDebug():Boolean {
			return is_debug$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStartServiceTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, start_service_time$field);
			}
			if (hasServerLinkedTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, server_linked_time$field);
			}
			for (var unionServerConfig$index:uint = 0; unionServerConfig$index < this.unionServerConfig.length; ++unionServerConfig$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, this.unionServerConfig[unionServerConfig$index]);
			}
			if (hasBattleStartRegularTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, battle_start_regular_time$field);
			}
			if (hasUnionServiceTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, union_service_time$field);
			}
			if (hasInterconnectedTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, interconnected_time$field);
			}
			if (hasIsDebug) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_debug$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start_service_time$count:uint = 0;
			var server_linked_time$count:uint = 0;
			var battle_start_regular_time$count:uint = 0;
			var union_service_time$count:uint = 0;
			var interconnected_time$count:uint = 0;
			var is_debug$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start_service_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ServiceConfig.startServiceTime cannot be set twice.');
					}
					++start_service_time$count;
					this.startServiceTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (server_linked_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ServiceConfig.serverLinkedTime cannot be set twice.');
					}
					++server_linked_time$count;
					this.serverLinkedTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					this.unionServerConfig.push(com.netease.protobuf.ReadUtils.read_TYPE_STRING(input));
					break;
				case 9:
					if (battle_start_regular_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ServiceConfig.battleStartRegularTime cannot be set twice.');
					}
					++battle_start_regular_time$count;
					this.battleStartRegularTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (union_service_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ServiceConfig.unionServiceTime cannot be set twice.');
					}
					++union_service_time$count;
					this.unionServiceTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (interconnected_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ServiceConfig.interconnectedTime cannot be set twice.');
					}
					++interconnected_time$count;
					this.interconnectedTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (is_debug$count != 0) {
						throw new flash.errors.IOError('Bad data format: ServiceConfig.isDebug cannot be set twice.');
					}
					++is_debug$count;
					this.isDebug = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
