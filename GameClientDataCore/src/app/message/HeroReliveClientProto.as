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
	public dynamic final class HeroReliveClientProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ORIGIN_RELIVE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroReliveClientProto.origin_relive_times", "originReliveTimes", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var origin_relive_times$field:int;

		private var hasField$0:uint = 0;

		public function clearOriginReliveTimes():void {
			hasField$0 &= 0xfffffffe;
			origin_relive_times$field = new int();
		}

		public function get hasOriginReliveTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set originReliveTimes(value:int):void {
			hasField$0 |= 0x1;
			origin_relive_times$field = value;
		}

		public function get originReliveTimes():int {
			return origin_relive_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ORIGIN_RELIVE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroReliveClientProto.total_origin_relive_times", "totalOriginReliveTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_origin_relive_times$field:int;

		public function clearTotalOriginReliveTimes():void {
			hasField$0 &= 0xfffffffd;
			total_origin_relive_times$field = new int();
		}

		public function get hasTotalOriginReliveTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set totalOriginReliveTimes(value:int):void {
			hasField$0 |= 0x2;
			total_origin_relive_times$field = value;
		}

		public function get totalOriginReliveTimes():int {
			return total_origin_relive_times$field;
		}

		/**
		 *  @private
		 */
		public static const ORIGIN_PERFECT_RELIVE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroReliveClientProto.origin_perfect_relive_times", "originPerfectReliveTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var origin_perfect_relive_times$field:int;

		public function clearOriginPerfectReliveTimes():void {
			hasField$0 &= 0xfffffffb;
			origin_perfect_relive_times$field = new int();
		}

		public function get hasOriginPerfectReliveTimes():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set originPerfectReliveTimes(value:int):void {
			hasField$0 |= 0x4;
			origin_perfect_relive_times$field = value;
		}

		public function get originPerfectReliveTimes():int {
			return origin_perfect_relive_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ORIGIN_PERFECT_RELIVE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroReliveClientProto.total_origin_perfect_relive_times", "totalOriginPerfectReliveTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_origin_perfect_relive_times$field:int;

		public function clearTotalOriginPerfectReliveTimes():void {
			hasField$0 &= 0xfffffff7;
			total_origin_perfect_relive_times$field = new int();
		}

		public function get hasTotalOriginPerfectReliveTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set totalOriginPerfectReliveTimes(value:int):void {
			hasField$0 |= 0x8;
			total_origin_perfect_relive_times$field = value;
		}

		public function get totalOriginPerfectReliveTimes():int {
			return total_origin_perfect_relive_times$field;
		}

		/**
		 *  @private
		 */
		public static const AUTO_TOWN_RELIVE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.HeroReliveClientProto.auto_town_relive_time", "autoTownReliveTime", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var auto_town_relive_time$field:Int64;

		public function clearAutoTownReliveTime():void {
			auto_town_relive_time$field = null;
		}

		public function get hasAutoTownReliveTime():Boolean {
			return auto_town_relive_time$field != null;
		}

		public function set autoTownReliveTime(value:Int64):void {
			auto_town_relive_time$field = value;
		}

		public function get autoTownReliveTime():Int64 {
			return auto_town_relive_time$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_XIN_CHUN_GE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.HeroReliveClientProto.can_xin_chun_ge", "canXinChunGe", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_xin_chun_ge$field:Boolean;

		public function clearCanXinChunGe():void {
			hasField$0 &= 0xffffffef;
			can_xin_chun_ge$field = new Boolean();
		}

		public function get hasCanXinChunGe():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set canXinChunGe(value:Boolean):void {
			hasField$0 |= 0x10;
			can_xin_chun_ge$field = value;
		}

		public function get canXinChunGe():Boolean {
			return can_xin_chun_ge$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SHANG_BU_QI:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.HeroReliveClientProto.can_shang_bu_qi", "canShangBuQi", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_shang_bu_qi$field:Boolean;

		public function clearCanShangBuQi():void {
			hasField$0 &= 0xffffffdf;
			can_shang_bu_qi$field = new Boolean();
		}

		public function get hasCanShangBuQi():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canShangBuQi(value:Boolean):void {
			hasField$0 |= 0x20;
			can_shang_bu_qi$field = value;
		}

		public function get canShangBuQi():Boolean {
			return can_shang_bu_qi$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_PAO_DE_KUAI:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.HeroReliveClientProto.can_pao_de_kuai", "canPaoDeKuai", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_pao_de_kuai$field:Boolean;

		public function clearCanPaoDeKuai():void {
			hasField$0 &= 0xffffffbf;
			can_pao_de_kuai$field = new Boolean();
		}

		public function get hasCanPaoDeKuai():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set canPaoDeKuai(value:Boolean):void {
			hasField$0 |= 0x40;
			can_pao_de_kuai$field = value;
		}

		public function get canPaoDeKuai():Boolean {
			return can_pao_de_kuai$field;
		}

		/**
		 *  @private
		 */
		public static const ORIGIN_RELIVE_DISCOUNT_END_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.HeroReliveClientProto.origin_relive_discount_end_time", "originReliveDiscountEndTime", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var origin_relive_discount_end_time$field:Int64;

		public function clearOriginReliveDiscountEndTime():void {
			origin_relive_discount_end_time$field = null;
		}

		public function get hasOriginReliveDiscountEndTime():Boolean {
			return origin_relive_discount_end_time$field != null;
		}

		public function set originReliveDiscountEndTime(value:Int64):void {
			origin_relive_discount_end_time$field = value;
		}

		public function get originReliveDiscountEndTime():Int64 {
			return origin_relive_discount_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const ORIGIN_RELIVE_DISCOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroReliveClientProto.origin_relive_discount", "originReliveDiscount", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var origin_relive_discount$field:int;

		public function clearOriginReliveDiscount():void {
			hasField$0 &= 0xffffff7f;
			origin_relive_discount$field = new int();
		}

		public function get hasOriginReliveDiscount():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set originReliveDiscount(value:int):void {
			hasField$0 |= 0x80;
			origin_relive_discount$field = value;
		}

		public function get originReliveDiscount():int {
			return origin_relive_discount$field;
		}

		/**
		 *  @private
		 */
		public static const ORIGIN_PERFECT_RELIVE_DISCOUNT_END_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.HeroReliveClientProto.origin_perfect_relive_discount_end_time", "originPerfectReliveDiscountEndTime", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var origin_perfect_relive_discount_end_time$field:Int64;

		public function clearOriginPerfectReliveDiscountEndTime():void {
			origin_perfect_relive_discount_end_time$field = null;
		}

		public function get hasOriginPerfectReliveDiscountEndTime():Boolean {
			return origin_perfect_relive_discount_end_time$field != null;
		}

		public function set originPerfectReliveDiscountEndTime(value:Int64):void {
			origin_perfect_relive_discount_end_time$field = value;
		}

		public function get originPerfectReliveDiscountEndTime():Int64 {
			return origin_perfect_relive_discount_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const ORIGIN_PERFECT_RELIVE_DISCOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroReliveClientProto.origin_perfect_relive_discount", "originPerfectReliveDiscount", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var origin_perfect_relive_discount$field:int;

		public function clearOriginPerfectReliveDiscount():void {
			hasField$0 &= 0xfffffeff;
			origin_perfect_relive_discount$field = new int();
		}

		public function get hasOriginPerfectReliveDiscount():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set originPerfectReliveDiscount(value:int):void {
			hasField$0 |= 0x100;
			origin_perfect_relive_discount$field = value;
		}

		public function get originPerfectReliveDiscount():int {
			return origin_perfect_relive_discount$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOriginReliveTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, origin_relive_times$field);
			}
			if (hasTotalOriginReliveTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, total_origin_relive_times$field);
			}
			if (hasOriginPerfectReliveTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, origin_perfect_relive_times$field);
			}
			if (hasTotalOriginPerfectReliveTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, total_origin_perfect_relive_times$field);
			}
			if (hasAutoTownReliveTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, auto_town_relive_time$field);
			}
			if (hasCanXinChunGe) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_xin_chun_ge$field);
			}
			if (hasCanShangBuQi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_shang_bu_qi$field);
			}
			if (hasCanPaoDeKuai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_pao_de_kuai$field);
			}
			if (hasOriginReliveDiscountEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, origin_relive_discount_end_time$field);
			}
			if (hasOriginReliveDiscount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, origin_relive_discount$field);
			}
			if (hasOriginPerfectReliveDiscountEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, origin_perfect_relive_discount_end_time$field);
			}
			if (hasOriginPerfectReliveDiscount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, origin_perfect_relive_discount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var origin_relive_times$count:uint = 0;
			var total_origin_relive_times$count:uint = 0;
			var origin_perfect_relive_times$count:uint = 0;
			var total_origin_perfect_relive_times$count:uint = 0;
			var auto_town_relive_time$count:uint = 0;
			var can_xin_chun_ge$count:uint = 0;
			var can_shang_bu_qi$count:uint = 0;
			var can_pao_de_kuai$count:uint = 0;
			var origin_relive_discount_end_time$count:uint = 0;
			var origin_relive_discount$count:uint = 0;
			var origin_perfect_relive_discount_end_time$count:uint = 0;
			var origin_perfect_relive_discount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (origin_relive_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.originReliveTimes cannot be set twice.');
					}
					++origin_relive_times$count;
					this.originReliveTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (total_origin_relive_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.totalOriginReliveTimes cannot be set twice.');
					}
					++total_origin_relive_times$count;
					this.totalOriginReliveTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (origin_perfect_relive_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.originPerfectReliveTimes cannot be set twice.');
					}
					++origin_perfect_relive_times$count;
					this.originPerfectReliveTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (total_origin_perfect_relive_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.totalOriginPerfectReliveTimes cannot be set twice.');
					}
					++total_origin_perfect_relive_times$count;
					this.totalOriginPerfectReliveTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (auto_town_relive_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.autoTownReliveTime cannot be set twice.');
					}
					++auto_town_relive_time$count;
					this.autoTownReliveTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 7:
					if (can_xin_chun_ge$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.canXinChunGe cannot be set twice.');
					}
					++can_xin_chun_ge$count;
					this.canXinChunGe = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 8:
					if (can_shang_bu_qi$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.canShangBuQi cannot be set twice.');
					}
					++can_shang_bu_qi$count;
					this.canShangBuQi = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 9:
					if (can_pao_de_kuai$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.canPaoDeKuai cannot be set twice.');
					}
					++can_pao_de_kuai$count;
					this.canPaoDeKuai = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 10:
					if (origin_relive_discount_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.originReliveDiscountEndTime cannot be set twice.');
					}
					++origin_relive_discount_end_time$count;
					this.originReliveDiscountEndTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 11:
					if (origin_relive_discount$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.originReliveDiscount cannot be set twice.');
					}
					++origin_relive_discount$count;
					this.originReliveDiscount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (origin_perfect_relive_discount_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.originPerfectReliveDiscountEndTime cannot be set twice.');
					}
					++origin_perfect_relive_discount_end_time$count;
					this.originPerfectReliveDiscountEndTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 13:
					if (origin_perfect_relive_discount$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroReliveClientProto.originPerfectReliveDiscount cannot be set twice.');
					}
					++origin_perfect_relive_discount$count;
					this.originPerfectReliveDiscount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
