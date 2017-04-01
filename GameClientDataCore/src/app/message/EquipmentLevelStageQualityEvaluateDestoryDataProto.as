package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Quality;
	import app.message.Evaluate;
	import app.message.EquipmentDestroyPrizeDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentLevelStageQualityEvaluateDestoryDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_STAGE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentLevelStageQualityEvaluateDestoryDataProto.level_stage", "levelStage", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_stage$field:int;

		private var hasField$0:uint = 0;

		public function clearLevelStage():void {
			hasField$0 &= 0xfffffffe;
			level_stage$field = new int();
		}

		public function get hasLevelStage():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set levelStage(value:int):void {
			hasField$0 |= 0x1;
			level_stage$field = value;
		}

		public function get levelStage():int {
			return level_stage$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentLevelStageQualityEvaluateDestoryDataProto.quality", "quality", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		public function clearQuality():void {
			hasField$0 &= 0xfffffffd;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x2;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const EVALUATE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentLevelStageQualityEvaluateDestoryDataProto.evaluate", "evaluate", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Evaluate);

		private var evaluate$field:int;

		public function clearEvaluate():void {
			hasField$0 &= 0xfffffffb;
			evaluate$field = new int();
		}

		public function get hasEvaluate():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set evaluate(value:int):void {
			hasField$0 |= 0x4;
			evaluate$field = value;
		}

		public function get evaluate():int {
			return evaluate$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentLevelStageQualityEvaluateDestoryDataProto.money_cost", "moneyCost", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_cost$field:int;

		public function clearMoneyCost():void {
			hasField$0 &= 0xfffffff7;
			money_cost$field = new int();
		}

		public function get hasMoneyCost():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set moneyCost(value:int):void {
			hasField$0 |= 0x8;
			money_cost$field = value;
		}

		public function get moneyCost():int {
			return money_cost$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.EquipmentLevelStageQualityEvaluateDestoryDataProto.prize", "prize", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentDestroyPrizeDataProto; });

		[ArrayElementType("app.message.EquipmentDestroyPrizeDataProto")]
		public var prize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevelStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level_stage$field);
			}
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, quality$field);
			}
			if (hasEvaluate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, evaluate$field);
			}
			if (hasMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, money_cost$field);
			}
			for (var prize$index:uint = 0; prize$index < this.prize.length; ++prize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.prize[prize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level_stage$count:uint = 0;
			var quality$count:uint = 0;
			var evaluate$count:uint = 0;
			var money_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level_stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentLevelStageQualityEvaluateDestoryDataProto.levelStage cannot be set twice.');
					}
					++level_stage$count;
					this.levelStage = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentLevelStageQualityEvaluateDestoryDataProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (evaluate$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentLevelStageQualityEvaluateDestoryDataProto.evaluate cannot be set twice.');
					}
					++evaluate$count;
					this.evaluate = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if (money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentLevelStageQualityEvaluateDestoryDataProto.moneyCost cannot be set twice.');
					}
					++money_cost$count;
					this.moneyCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					this.prize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.EquipmentDestroyPrizeDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
