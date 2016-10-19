package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NpcMazePrizeAndEnterNextDialogProto;
	import app.message.NpcDialogProto.NpcType;
	import app.message.NpcMazePrizeDialogProto;
	import app.message.NpcDialogProto.NpcShopDialogProto;
	import app.message.NpcCountryUsableType;
	import app.message.NpcDialogProto.TransportDialogProto;
	import app.message.NpcDialogProto.NormalDialogProto;
	import app.message.NpcDialogProto.VehiclePathDialogProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NpcDialogProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NPC_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.NpcDialogProto.npc_type", "npcType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.NpcDialogProto.NpcType);

		private var npc_type$field:int;

		private var hasField$0:uint = 0;

		public function clearNpcType():void {
			hasField$0 &= 0xfffffffe;
			npc_type$field = new int();
		}

		public function get hasNpcType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set npcType(value:int):void {
			hasField$0 |= 0x1;
			npc_type$field = value;
		}

		public function get npcType():int {
			return npc_type$field;
		}

		/**
		 *  @private
		 */
		public static const FUNC_DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NpcDialogProto.func_desc", "funcDesc", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var func_desc$field:String;

		public function clearFuncDesc():void {
			func_desc$field = null;
		}

		public function get hasFuncDesc():Boolean {
			return func_desc$field != null;
		}

		public function set funcDesc(value:String):void {
			func_desc$field = value;
		}

		public function get funcDesc():String {
			return func_desc$field;
		}

		/**
		 *  @private
		 */
		public static const DIALOG_CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NpcDialogProto.dialog_content", "dialogContent", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var dialog_content$field:String;

		public function clearDialogContent():void {
			dialog_content$field = null;
		}

		public function get hasDialogContent():Boolean {
			return dialog_content$field != null;
		}

		public function set dialogContent(value:String):void {
			dialog_content$field = value;
		}

		public function get dialogContent():String {
			return dialog_content$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_USABLE_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.NpcDialogProto.country_usable_type", "countryUsableType", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.NpcCountryUsableType);

		private var country_usable_type$field:int;

		public function clearCountryUsableType():void {
			hasField$0 &= 0xfffffffd;
			country_usable_type$field = new int();
		}

		public function get hasCountryUsableType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set countryUsableType(value:int):void {
			hasField$0 |= 0x2;
			country_usable_type$field = value;
		}

		public function get countryUsableType():int {
			return country_usable_type$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NpcDialogProto.normal", "normal", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcDialogProto.NormalDialogProto; });

		private var normal$field:app.message.NpcDialogProto.NormalDialogProto;

		public function clearNormal():void {
			normal$field = null;
		}

		public function get hasNormal():Boolean {
			return normal$field != null;
		}

		public function set normal(value:app.message.NpcDialogProto.NormalDialogProto):void {
			normal$field = value;
		}

		public function get normal():app.message.NpcDialogProto.NormalDialogProto {
			return normal$field;
		}

		/**
		 *  @private
		 */
		public static const NPC_SHOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NpcDialogProto.npc_shop", "npcShop", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcDialogProto.NpcShopDialogProto; });

		private var npc_shop$field:app.message.NpcDialogProto.NpcShopDialogProto;

		public function clearNpcShop():void {
			npc_shop$field = null;
		}

		public function get hasNpcShop():Boolean {
			return npc_shop$field != null;
		}

		public function set npcShop(value:app.message.NpcDialogProto.NpcShopDialogProto):void {
			npc_shop$field = value;
		}

		public function get npcShop():app.message.NpcDialogProto.NpcShopDialogProto {
			return npc_shop$field;
		}

		/**
		 *  @private
		 */
		public static const TRANSPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NpcDialogProto.transport", "transport", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcDialogProto.TransportDialogProto; });

		private var transport$field:app.message.NpcDialogProto.TransportDialogProto;

		public function clearTransport():void {
			transport$field = null;
		}

		public function get hasTransport():Boolean {
			return transport$field != null;
		}

		public function set transport(value:app.message.NpcDialogProto.TransportDialogProto):void {
			transport$field = value;
		}

		public function get transport():app.message.NpcDialogProto.TransportDialogProto {
			return transport$field;
		}

		/**
		 *  @private
		 */
		public static const MAZE_PRIZE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NpcDialogProto.maze_prize", "mazePrize", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcMazePrizeDialogProto; });

		private var maze_prize$field:app.message.NpcMazePrizeDialogProto;

		public function clearMazePrize():void {
			maze_prize$field = null;
		}

		public function get hasMazePrize():Boolean {
			return maze_prize$field != null;
		}

		public function set mazePrize(value:app.message.NpcMazePrizeDialogProto):void {
			maze_prize$field = value;
		}

		public function get mazePrize():app.message.NpcMazePrizeDialogProto {
			return maze_prize$field;
		}

		/**
		 *  @private
		 */
		public static const MAZE_PRIZE_AND_ENTER_NEXT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NpcDialogProto.maze_prize_and_enter_next", "mazePrizeAndEnterNext", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcMazePrizeAndEnterNextDialogProto; });

		private var maze_prize_and_enter_next$field:app.message.NpcMazePrizeAndEnterNextDialogProto;

		public function clearMazePrizeAndEnterNext():void {
			maze_prize_and_enter_next$field = null;
		}

		public function get hasMazePrizeAndEnterNext():Boolean {
			return maze_prize_and_enter_next$field != null;
		}

		public function set mazePrizeAndEnterNext(value:app.message.NpcMazePrizeAndEnterNextDialogProto):void {
			maze_prize_and_enter_next$field = value;
		}

		public function get mazePrizeAndEnterNext():app.message.NpcMazePrizeAndEnterNextDialogProto {
			return maze_prize_and_enter_next$field;
		}

		/**
		 *  @private
		 */
		public static const VEHICLE_PATH:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NpcDialogProto.vehicle_path", "vehiclePath", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcDialogProto.VehiclePathDialogProto; });

		private var vehicle_path$field:app.message.NpcDialogProto.VehiclePathDialogProto;

		public function clearVehiclePath():void {
			vehicle_path$field = null;
		}

		public function get hasVehiclePath():Boolean {
			return vehicle_path$field != null;
		}

		public function set vehiclePath(value:app.message.NpcDialogProto.VehiclePathDialogProto):void {
			vehicle_path$field = value;
		}

		public function get vehiclePath():app.message.NpcDialogProto.VehiclePathDialogProto {
			return vehicle_path$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNpcType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, npc_type$field);
			}
			if (hasFuncDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, func_desc$field);
			}
			if (hasDialogContent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, dialog_content$field);
			}
			if (hasCountryUsableType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, country_usable_type$field);
			}
			if (hasNormal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, normal$field);
			}
			if (hasNpcShop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, npc_shop$field);
			}
			if (hasTransport) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, transport$field);
			}
			if (hasMazePrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, maze_prize$field);
			}
			if (hasMazePrizeAndEnterNext) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, maze_prize_and_enter_next$field);
			}
			if (hasVehiclePath) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, vehicle_path$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var npc_type$count:uint = 0;
			var func_desc$count:uint = 0;
			var dialog_content$count:uint = 0;
			var country_usable_type$count:uint = 0;
			var normal$count:uint = 0;
			var npc_shop$count:uint = 0;
			var transport$count:uint = 0;
			var maze_prize$count:uint = 0;
			var maze_prize_and_enter_next$count:uint = 0;
			var vehicle_path$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (npc_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.npcType cannot be set twice.');
					}
					++npc_type$count;
					this.npcType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (func_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.funcDesc cannot be set twice.');
					}
					++func_desc$count;
					this.funcDesc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (dialog_content$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.dialogContent cannot be set twice.');
					}
					++dialog_content$count;
					this.dialogContent = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (country_usable_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.countryUsableType cannot be set twice.');
					}
					++country_usable_type$count;
					this.countryUsableType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 10:
					if (normal$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.normal cannot be set twice.');
					}
					++normal$count;
					this.normal = new app.message.NpcDialogProto.NormalDialogProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.normal);
					break;
				case 11:
					if (npc_shop$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.npcShop cannot be set twice.');
					}
					++npc_shop$count;
					this.npcShop = new app.message.NpcDialogProto.NpcShopDialogProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.npcShop);
					break;
				case 12:
					if (transport$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.transport cannot be set twice.');
					}
					++transport$count;
					this.transport = new app.message.NpcDialogProto.TransportDialogProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.transport);
					break;
				case 13:
					if (maze_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.mazePrize cannot be set twice.');
					}
					++maze_prize$count;
					this.mazePrize = new app.message.NpcMazePrizeDialogProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mazePrize);
					break;
				case 14:
					if (maze_prize_and_enter_next$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.mazePrizeAndEnterNext cannot be set twice.');
					}
					++maze_prize_and_enter_next$count;
					this.mazePrizeAndEnterNext = new app.message.NpcMazePrizeAndEnterNextDialogProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mazePrizeAndEnterNext);
					break;
				case 15:
					if (vehicle_path$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcDialogProto.vehiclePath cannot be set twice.');
					}
					++vehicle_path$count;
					this.vehiclePath = new app.message.NpcDialogProto.VehiclePathDialogProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.vehiclePath);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
