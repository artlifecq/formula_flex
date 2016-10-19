package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpriteStatProto;
	import app.message.Quality;
	import app.message.Evaluate;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.EquipmentProto.quality", "quality", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		private var hasField$0:uint = 0;

		public function clearQuality():void {
			hasField$0 &= 0xfffffffe;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x1;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const EVALUATE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.EquipmentProto.evaluate", "evaluate", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Evaluate);

		private var evaluate$field:int;

		public function clearEvaluate():void {
			hasField$0 &= 0xfffffffd;
			evaluate$field = new int();
		}

		public function get hasEvaluate():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set evaluate(value:int):void {
			hasField$0 |= 0x2;
			evaluate$field = value;
		}

		public function get evaluate():int {
			return evaluate$field;
		}

		/**
		 *  @private
		 */
		public static const BASE_STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentProto.base_stat", "baseStat", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var base_stat$field:app.message.SpriteStatProto;

		public function clearBaseStat():void {
			base_stat$field = null;
		}

		public function get hasBaseStat():Boolean {
			return base_stat$field != null;
		}

		public function set baseStat(value:app.message.SpriteStatProto):void {
			base_stat$field = value;
		}

		public function get baseStat():app.message.SpriteStatProto {
			return base_stat$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOM_STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentProto.random_stat", "randomStat", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var random_stat$field:app.message.SpriteStatProto;

		public function clearRandomStat():void {
			random_stat$field = null;
		}

		public function get hasRandomStat():Boolean {
			return random_stat$field != null;
		}

		public function set randomStat(value:app.message.SpriteStatProto):void {
			random_stat$field = value;
		}

		public function get randomStat():app.message.SpriteStatProto {
			return random_stat$field;
		}

		/**
		 *  @private
		 */
		public static const DURABILITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentProto.durability", "durability", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var durability$field:int;

		public function clearDurability():void {
			hasField$0 &= 0xfffffffb;
			durability$field = new int();
		}

		public function get hasDurability():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set durability(value:int):void {
			hasField$0 |= 0x4;
			durability$field = value;
		}

		public function get durability():int {
			return durability$field;
		}

		/**
		 *  @private
		 */
		public static const USED_DURABILITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentProto.used_durability", "usedDurability", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var used_durability$field:int;

		public function clearUsedDurability():void {
			hasField$0 &= 0xfffffff7;
			used_durability$field = new int();
		}

		public function get hasUsedDurability():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set usedDurability(value:int):void {
			hasField$0 |= 0x8;
			used_durability$field = value;
		}

		public function get usedDurability():int {
			return used_durability$field;
		}

		/**
		 *  @private
		 */
		public static const REFINED_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentProto.refined_times", "refinedTimes", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refined_times$field:int;

		public function clearRefinedTimes():void {
			hasField$0 &= 0xffffffef;
			refined_times$field = new int();
		}

		public function get hasRefinedTimes():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set refinedTimes(value:int):void {
			hasField$0 |= 0x10;
			refined_times$field = value;
		}

		public function get refinedTimes():int {
			return refined_times$field;
		}

		/**
		 *  @private
		 */
		public static const REFINED_STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentProto.refined_stat", "refinedStat", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var refined_stat$field:app.message.SpriteStatProto;

		public function clearRefinedStat():void {
			refined_stat$field = null;
		}

		public function get hasRefinedStat():Boolean {
			return refined_stat$field != null;
		}

		public function set refinedStat(value:app.message.SpriteStatProto):void {
			refined_stat$field = value;
		}

		public function get refinedStat():app.message.SpriteStatProto {
			return refined_stat$field;
		}

		/**
		 *  @private
		 */
		public static const BUILD_SIGNATURE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.EquipmentProto.build_signature", "buildSignature", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var build_signature$field:String;

		public function clearBuildSignature():void {
			build_signature$field = null;
		}

		public function get hasBuildSignature():Boolean {
			return build_signature$field != null;
		}

		public function set buildSignature(value:String):void {
			build_signature$field = value;
		}

		public function get buildSignature():String {
			return build_signature$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHTING_AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.EquipmentProto.fighting_amount", "fightingAmount", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fighting_amount$field:Int64;

		public function clearFightingAmount():void {
			fighting_amount$field = null;
		}

		public function get hasFightingAmount():Boolean {
			return fighting_amount$field != null;
		}

		public function set fightingAmount(value:Int64):void {
			fighting_amount$field = value;
		}

		public function get fightingAmount():Int64 {
			return fighting_amount$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_GENERAL_CHANGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.EquipmentProto.can_general_change", "canGeneralChange", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_general_change$field:Boolean;

		public function clearCanGeneralChange():void {
			hasField$0 &= 0xffffffdf;
			can_general_change$field = new Boolean();
		}

		public function get hasCanGeneralChange():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canGeneralChange(value:Boolean):void {
			hasField$0 |= 0x20;
			can_general_change$field = value;
		}

		public function get canGeneralChange():Boolean {
			return can_general_change$field;
		}

		/**
		 *  @private
		 */
		public static const GENERAL_TAOZ_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentProto.general_taoz_id", "generalTaozId", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var general_taoz_id$field:int;

		public function clearGeneralTaozId():void {
			hasField$0 &= 0xffffffbf;
			general_taoz_id$field = new int();
		}

		public function get hasGeneralTaozId():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set generalTaozId(value:int):void {
			hasField$0 |= 0x40;
			general_taoz_id$field = value;
		}

		public function get generalTaozId():int {
			return general_taoz_id$field;
		}

		/**
		 *  @private
		 */
		public static const GENERAL_QUALITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.EquipmentProto.general_quality", "generalQuality", (13 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var general_quality$field:int;

		public function clearGeneralQuality():void {
			hasField$0 &= 0xffffff7f;
			general_quality$field = new int();
		}

		public function get hasGeneralQuality():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set generalQuality(value:int):void {
			hasField$0 |= 0x80;
			general_quality$field = value;
		}

		public function get generalQuality():int {
			return general_quality$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, quality$field);
			}
			if (hasEvaluate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, evaluate$field);
			}
			if (hasBaseStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, base_stat$field);
			}
			if (hasRandomStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, random_stat$field);
			}
			if (hasDurability) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, durability$field);
			}
			if (hasUsedDurability) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, used_durability$field);
			}
			if (hasRefinedTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, refined_times$field);
			}
			if (hasRefinedStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, refined_stat$field);
			}
			if (hasBuildSignature) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, build_signature$field);
			}
			if (hasFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, fighting_amount$field);
			}
			if (hasCanGeneralChange) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_general_change$field);
			}
			if (hasGeneralTaozId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, general_taoz_id$field);
			}
			if (hasGeneralQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, general_quality$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var quality$count:uint = 0;
			var evaluate$count:uint = 0;
			var base_stat$count:uint = 0;
			var random_stat$count:uint = 0;
			var durability$count:uint = 0;
			var used_durability$count:uint = 0;
			var refined_times$count:uint = 0;
			var refined_stat$count:uint = 0;
			var build_signature$count:uint = 0;
			var fighting_amount$count:uint = 0;
			var can_general_change$count:uint = 0;
			var general_taoz_id$count:uint = 0;
			var general_quality$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (evaluate$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.evaluate cannot be set twice.');
					}
					++evaluate$count;
					this.evaluate = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (base_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.baseStat cannot be set twice.');
					}
					++base_stat$count;
					this.baseStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.baseStat);
					break;
				case 4:
					if (random_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.randomStat cannot be set twice.');
					}
					++random_stat$count;
					this.randomStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.randomStat);
					break;
				case 5:
					if (durability$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.durability cannot be set twice.');
					}
					++durability$count;
					this.durability = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (used_durability$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.usedDurability cannot be set twice.');
					}
					++used_durability$count;
					this.usedDurability = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (refined_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.refinedTimes cannot be set twice.');
					}
					++refined_times$count;
					this.refinedTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (refined_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.refinedStat cannot be set twice.');
					}
					++refined_stat$count;
					this.refinedStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.refinedStat);
					break;
				case 9:
					if (build_signature$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.buildSignature cannot be set twice.');
					}
					++build_signature$count;
					this.buildSignature = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.fightingAmount cannot be set twice.');
					}
					++fighting_amount$count;
					this.fightingAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 11:
					if (can_general_change$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.canGeneralChange cannot be set twice.');
					}
					++can_general_change$count;
					this.canGeneralChange = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 12:
					if (general_taoz_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.generalTaozId cannot be set twice.');
					}
					++general_taoz_id$count;
					this.generalTaozId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (general_quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentProto.generalQuality cannot be set twice.');
					}
					++general_quality$count;
					this.generalQuality = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
