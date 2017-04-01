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
	public dynamic final class WatchWarCountryOfficeMemberProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.WatchWarCountryOfficeMemberProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:Int64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:Int64):void {
			id$field = value;
		}

		public function get id():Int64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.WatchWarCountryOfficeMemberProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ONLINE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.WatchWarCountryOfficeMemberProto.is_online", "isOnline", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_online$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsOnline():void {
			hasField$0 &= 0xfffffffe;
			is_online$field = new Boolean();
		}

		public function get hasIsOnline():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isOnline(value:Boolean):void {
			hasField$0 |= 0x1;
			is_online$field = value;
		}

		public function get isOnline():Boolean {
			return is_online$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.WatchWarCountryOfficeMemberProto.scene_id", "sceneId", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_id$field:int;

		public function clearSceneId():void {
			hasField$0 &= 0xfffffffd;
			scene_id$field = new int();
		}

		public function get hasSceneId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set sceneId(value:int):void {
			hasField$0 |= 0x2;
			scene_id$field = value;
		}

		public function get sceneId():int {
			return scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.WatchWarCountryOfficeMemberProto.scene_country", "sceneCountry", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_country$field:int;

		public function clearSceneCountry():void {
			hasField$0 &= 0xfffffffb;
			scene_country$field = new int();
		}

		public function get hasSceneCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set sceneCountry(value:int):void {
			hasField$0 |= 0x4;
			scene_country$field = value;
		}

		public function get sceneCountry():int {
			return scene_country$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasIsOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_online$field);
			}
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, scene_id$field);
			}
			if (hasSceneCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, scene_country$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var is_online$count:uint = 0;
			var scene_id$count:uint = 0;
			var scene_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: WatchWarCountryOfficeMemberProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: WatchWarCountryOfficeMemberProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 6:
					if (is_online$count != 0) {
						throw new flash.errors.IOError('Bad data format: WatchWarCountryOfficeMemberProto.isOnline cannot be set twice.');
					}
					++is_online$count;
					this.isOnline = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: WatchWarCountryOfficeMemberProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (scene_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: WatchWarCountryOfficeMemberProto.sceneCountry cannot be set twice.');
					}
					++scene_country$count;
					this.sceneCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
