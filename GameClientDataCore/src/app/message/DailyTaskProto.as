package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TaskProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DailyTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BASE_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.DailyTaskProto.base_task", "baseTask", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskProto; });

		private var base_task$field:app.message.TaskProto;

		public function clearBaseTask():void {
			base_task$field = null;
		}

		public function get hasBaseTask():Boolean {
			return base_task$field != null;
		}

		public function set baseTask(value:app.message.TaskProto):void {
			base_task$field = value;
		}

		public function get baseTask():app.message.TaskProto {
			return base_task$field;
		}

		/**
		 *  @private
		 */
		public static const ROUND:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyTaskProto.round", "round", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var round$field:int;

		private var hasField$0:uint = 0;

		public function clearRound():void {
			hasField$0 &= 0xfffffffe;
			round$field = new int();
		}

		public function get hasRound():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set round(value:int):void {
			hasField$0 |= 0x1;
			round$field = value;
		}

		public function get round():int {
			return round$field;
		}

		/**
		 *  @private
		 */
		public static const DIFFI_STAR:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyTaskProto.diffi_star", "diffiStar", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var diffi_star$field:int;

		public function clearDiffiStar():void {
			hasField$0 &= 0xfffffffd;
			diffi_star$field = new int();
		}

		public function get hasDiffiStar():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set diffiStar(value:int):void {
			hasField$0 |= 0x2;
			diffi_star$field = value;
		}

		public function get diffiStar():int {
			return diffi_star$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE_STAR:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyTaskProto.prize_star", "prizeStar", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var prize_star$field:int;

		public function clearPrizeStar():void {
			hasField$0 &= 0xfffffffb;
			prize_star$field = new int();
		}

		public function get hasPrizeStar():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set prizeStar(value:int):void {
			hasField$0 |= 0x4;
			prize_star$field = value;
		}

		public function get prizeStar():int {
			return prize_star$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBaseTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, base_task$field);
			}
			if (hasRound) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, round$field);
			}
			if (hasDiffiStar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, diffi_star$field);
			}
			if (hasPrizeStar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, prize_star$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var base_task$count:uint = 0;
			var round$count:uint = 0;
			var diffi_star$count:uint = 0;
			var prize_star$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (base_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskProto.baseTask cannot be set twice.');
					}
					++base_task$count;
					this.baseTask = new app.message.TaskProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.baseTask);
					break;
				case 2:
					if (round$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskProto.round cannot be set twice.');
					}
					++round$count;
					this.round = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (diffi_star$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskProto.diffiStar cannot be set twice.');
					}
					++diffi_star$count;
					this.diffiStar = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (prize_star$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskProto.prizeStar cannot be set twice.');
					}
					++prize_star$count;
					this.prizeStar = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
