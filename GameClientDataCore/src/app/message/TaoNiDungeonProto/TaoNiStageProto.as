package app.message.TaoNiDungeonProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Int32PairProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TaoNiStageProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaoNiDungeonProto.TaoNiStageProto.stage", "stage", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stage$field:int;

		private var hasField$0:uint = 0;

		public function clearStage():void {
			hasField$0 &= 0xfffffffe;
			stage$field = new int();
		}

		public function get hasStage():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set stage(value:int):void {
			hasField$0 |= 0x1;
			stage$field = value;
		}

		public function get stage():int {
			return stage$field;
		}

		/**
		 *  @private
		 */
		public static const STAGE_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.TaoNiDungeonProto.TaoNiStageProto.stage_name", "stageName", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var stage_name$field:String;

		public function clearStageName():void {
			stage_name$field = null;
		}

		public function get hasStageName():Boolean {
			return stage_name$field != null;
		}

		public function set stageName(value:String):void {
			stage_name$field = value;
		}

		public function get stageName():String {
			return stage_name$field;
		}

		/**
		 *  @private
		 */
		public static const DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.TaoNiDungeonProto.TaoNiStageProto.duration", "duration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var duration$field:Int64;

		public function clearDuration():void {
			duration$field = null;
		}

		public function get hasDuration():Boolean {
			return duration$field != null;
		}

		public function set duration(value:Int64):void {
			duration$field = value;
		}

		public function get duration():Int64 {
			return duration$field;
		}

		/**
		 *  @private
		 */
		public static const MONSTER_ID_COUNT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.TaoNiDungeonProto.TaoNiStageProto.monster_id_count", "monsterIdCount", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Int32PairProto; });

		[ArrayElementType("app.message.Int32PairProto")]
		public var monsterIdCount:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, stage$field);
			}
			if (hasStageName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, stage_name$field);
			}
			if (hasDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, duration$field);
			}
			for (var monsterIdCount$index:uint = 0; monsterIdCount$index < this.monsterIdCount.length; ++monsterIdCount$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.monsterIdCount[monsterIdCount$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var stage$count:uint = 0;
			var stage_name$count:uint = 0;
			var duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaoNiStageProto.stage cannot be set twice.');
					}
					++stage$count;
					this.stage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (stage_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaoNiStageProto.stageName cannot be set twice.');
					}
					++stage_name$count;
					this.stageName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaoNiStageProto.duration cannot be set twice.');
					}
					++duration$count;
					this.duration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					this.monsterIdCount.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.Int32PairProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
