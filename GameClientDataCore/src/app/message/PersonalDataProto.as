package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	import app.message.BiaoResProto;
	import app.message.BiaoQualityPrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PersonalDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalDataProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_ACESS_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.normal_acess_cost", "normalAcessCost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var normal_acess_cost$field:app.message.UpgradeProto;

		public function clearNormalAcessCost():void {
			normal_acess_cost$field = null;
		}

		public function get hasNormalAcessCost():Boolean {
			return normal_acess_cost$field != null;
		}

		public function set normalAcessCost(value:app.message.UpgradeProto):void {
			normal_acess_cost$field = value;
		}

		public function get normalAcessCost():app.message.UpgradeProto {
			return normal_acess_cost$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_BIAO_ACESS_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.add_biao_acess_cost", "addBiaoAcessCost", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var add_biao_acess_cost$field:app.message.UpgradeProto;

		public function clearAddBiaoAcessCost():void {
			add_biao_acess_cost$field = null;
		}

		public function get hasAddBiaoAcessCost():Boolean {
			return add_biao_acess_cost$field != null;
		}

		public function set addBiaoAcessCost(value:app.message.UpgradeProto):void {
			add_biao_acess_cost$field = value;
		}

		public function get addBiaoAcessCost():app.message.UpgradeProto {
			return add_biao_acess_cost$field;
		}

		/**
		 *  @private
		 */
		public static const INVICINBLE_BIAO_ACESS_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.invicinble_biao_acess_cost", "invicinbleBiaoAcessCost", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var invicinble_biao_acess_cost$field:app.message.UpgradeProto;

		public function clearInvicinbleBiaoAcessCost():void {
			invicinble_biao_acess_cost$field = null;
		}

		public function get hasInvicinbleBiaoAcessCost():Boolean {
			return invicinble_biao_acess_cost$field != null;
		}

		public function set invicinbleBiaoAcessCost(value:app.message.UpgradeProto):void {
			invicinble_biao_acess_cost$field = value;
		}

		public function get invicinbleBiaoAcessCost():app.message.UpgradeProto {
			return invicinble_biao_acess_cost$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_BIAO_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.normal_biao_prize", "normalBiaoPrize", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoQualityPrizeProto; });

		private var normal_biao_prize$field:app.message.BiaoQualityPrizeProto;

		public function clearNormalBiaoPrize():void {
			normal_biao_prize$field = null;
		}

		public function get hasNormalBiaoPrize():Boolean {
			return normal_biao_prize$field != null;
		}

		public function set normalBiaoPrize(value:app.message.BiaoQualityPrizeProto):void {
			normal_biao_prize$field = value;
		}

		public function get normalBiaoPrize():app.message.BiaoQualityPrizeProto {
			return normal_biao_prize$field;
		}

		/**
		 *  @private
		 */
		public static const BROKEN_BIAO_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.broken_biao_prize", "brokenBiaoPrize", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoQualityPrizeProto; });

		private var broken_biao_prize$field:app.message.BiaoQualityPrizeProto;

		public function clearBrokenBiaoPrize():void {
			broken_biao_prize$field = null;
		}

		public function get hasBrokenBiaoPrize():Boolean {
			return broken_biao_prize$field != null;
		}

		public function set brokenBiaoPrize(value:app.message.BiaoQualityPrizeProto):void {
			broken_biao_prize$field = value;
		}

		public function get brokenBiaoPrize():app.message.BiaoQualityPrizeProto {
			return broken_biao_prize$field;
		}

		/**
		 *  @private
		 */
		public static const INVICINBLE_BIAO_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.invicinble_biao_prize", "invicinbleBiaoPrize", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoQualityPrizeProto; });

		private var invicinble_biao_prize$field:app.message.BiaoQualityPrizeProto;

		public function clearInvicinbleBiaoPrize():void {
			invicinble_biao_prize$field = null;
		}

		public function get hasInvicinbleBiaoPrize():Boolean {
			return invicinble_biao_prize$field != null;
		}

		public function set invicinbleBiaoPrize(value:app.message.BiaoQualityPrizeProto):void {
			invicinble_biao_prize$field = value;
		}

		public function get invicinbleBiaoPrize():app.message.BiaoQualityPrizeProto {
			return invicinble_biao_prize$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_BIAO_RES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.normal_biao_res", "normalBiaoRes", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoResProto; });

		private var normal_biao_res$field:app.message.BiaoResProto;

		public function clearNormalBiaoRes():void {
			normal_biao_res$field = null;
		}

		public function get hasNormalBiaoRes():Boolean {
			return normal_biao_res$field != null;
		}

		public function set normalBiaoRes(value:app.message.BiaoResProto):void {
			normal_biao_res$field = value;
		}

		public function get normalBiaoRes():app.message.BiaoResProto {
			return normal_biao_res$field;
		}

		/**
		 *  @private
		 */
		public static const BROKEN_BIAO_RES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PersonalDataProto.broken_biao_res", "brokenBiaoRes", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoResProto; });

		private var broken_biao_res$field:app.message.BiaoResProto;

		public function clearBrokenBiaoRes():void {
			broken_biao_res$field = null;
		}

		public function get hasBrokenBiaoRes():Boolean {
			return broken_biao_res$field != null;
		}

		public function set brokenBiaoRes(value:app.message.BiaoResProto):void {
			broken_biao_res$field = value;
		}

		public function get brokenBiaoRes():app.message.BiaoResProto {
			return broken_biao_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasNormalAcessCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, normal_acess_cost$field);
			}
			if (hasAddBiaoAcessCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, add_biao_acess_cost$field);
			}
			if (hasInvicinbleBiaoAcessCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, invicinble_biao_acess_cost$field);
			}
			if (hasNormalBiaoPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, normal_biao_prize$field);
			}
			if (hasBrokenBiaoPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, broken_biao_prize$field);
			}
			if (hasInvicinbleBiaoPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, invicinble_biao_prize$field);
			}
			if (hasNormalBiaoRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, normal_biao_res$field);
			}
			if (hasBrokenBiaoRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, broken_biao_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level$count:uint = 0;
			var normal_acess_cost$count:uint = 0;
			var add_biao_acess_cost$count:uint = 0;
			var invicinble_biao_acess_cost$count:uint = 0;
			var normal_biao_prize$count:uint = 0;
			var broken_biao_prize$count:uint = 0;
			var invicinble_biao_prize$count:uint = 0;
			var normal_biao_res$count:uint = 0;
			var broken_biao_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (normal_acess_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.normalAcessCost cannot be set twice.');
					}
					++normal_acess_cost$count;
					this.normalAcessCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.normalAcessCost);
					break;
				case 3:
					if (add_biao_acess_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.addBiaoAcessCost cannot be set twice.');
					}
					++add_biao_acess_cost$count;
					this.addBiaoAcessCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.addBiaoAcessCost);
					break;
				case 4:
					if (invicinble_biao_acess_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.invicinbleBiaoAcessCost cannot be set twice.');
					}
					++invicinble_biao_acess_cost$count;
					this.invicinbleBiaoAcessCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.invicinbleBiaoAcessCost);
					break;
				case 5:
					if (normal_biao_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.normalBiaoPrize cannot be set twice.');
					}
					++normal_biao_prize$count;
					this.normalBiaoPrize = new app.message.BiaoQualityPrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.normalBiaoPrize);
					break;
				case 6:
					if (broken_biao_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.brokenBiaoPrize cannot be set twice.');
					}
					++broken_biao_prize$count;
					this.brokenBiaoPrize = new app.message.BiaoQualityPrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.brokenBiaoPrize);
					break;
				case 7:
					if (invicinble_biao_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.invicinbleBiaoPrize cannot be set twice.');
					}
					++invicinble_biao_prize$count;
					this.invicinbleBiaoPrize = new app.message.BiaoQualityPrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.invicinbleBiaoPrize);
					break;
				case 8:
					if (normal_biao_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.normalBiaoRes cannot be set twice.');
					}
					++normal_biao_res$count;
					this.normalBiaoRes = new app.message.BiaoResProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.normalBiaoRes);
					break;
				case 9:
					if (broken_biao_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalDataProto.brokenBiaoRes cannot be set twice.');
					}
					++broken_biao_res$count;
					this.brokenBiaoRes = new app.message.BiaoResProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.brokenBiaoRes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
