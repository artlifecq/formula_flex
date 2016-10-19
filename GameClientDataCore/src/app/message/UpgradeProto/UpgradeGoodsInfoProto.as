package app.message.UpgradeProto {
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
	public dynamic final class UpgradeGoodsInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UPGRADE_GOODS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradeProto.UpgradeGoodsInfoProto.upgrade_goods", "upgradeGoods", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_goods$field:int;

		private var hasField$0:uint = 0;

		public function clearUpgradeGoods():void {
			hasField$0 &= 0xfffffffe;
			upgrade_goods$field = new int();
		}

		public function get hasUpgradeGoods():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set upgradeGoods(value:int):void {
			hasField$0 |= 0x1;
			upgrade_goods$field = value;
		}

		public function get upgradeGoods():int {
			return upgrade_goods$field;
		}

		/**
		 *  @private
		 */
		public static const SUBSTITUTE_GOODS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.UpgradeProto.UpgradeGoodsInfoProto.substitute_goods", "substituteGoods", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var substituteGoods:Array = [];

		/**
		 *  @private
		 */
		public static const UPGRADE_GOODS_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradeProto.UpgradeGoodsInfoProto.upgrade_goods_count", "upgradeGoodsCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_goods_count$field:int;

		public function clearUpgradeGoodsCount():void {
			hasField$0 &= 0xfffffffd;
			upgrade_goods_count$field = new int();
		}

		public function get hasUpgradeGoodsCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set upgradeGoodsCount(value:int):void {
			hasField$0 |= 0x2;
			upgrade_goods_count$field = value;
		}

		public function get upgradeGoodsCount():int {
			return upgrade_goods_count$field;
		}

		/**
		 *  @private
		 */
		public static const BAND_JINZI_PRICE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradeProto.UpgradeGoodsInfoProto.band_jinzi_price", "bandJinziPrice", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var band_jinzi_price$field:int;

		public function clearBandJinziPrice():void {
			hasField$0 &= 0xfffffffb;
			band_jinzi_price$field = new int();
		}

		public function get hasBandJinziPrice():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set bandJinziPrice(value:int):void {
			hasField$0 |= 0x4;
			band_jinzi_price$field = value;
		}

		public function get bandJinziPrice():int {
			return band_jinzi_price$field;
		}

		/**
		 *  @private
		 */
		public static const JINZI_PRICE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradeProto.UpgradeGoodsInfoProto.jinzi_price", "jinziPrice", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jinzi_price$field:int;

		public function clearJinziPrice():void {
			hasField$0 &= 0xfffffff7;
			jinzi_price$field = new int();
		}

		public function get hasJinziPrice():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set jinziPrice(value:int):void {
			hasField$0 |= 0x8;
			jinzi_price$field = value;
		}

		public function get jinziPrice():int {
			return jinzi_price$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUpgradeGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, upgrade_goods$field);
			}
			for (var substituteGoods$index:uint = 0; substituteGoods$index < this.substituteGoods.length; ++substituteGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.substituteGoods[substituteGoods$index]);
			}
			if (hasUpgradeGoodsCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, upgrade_goods_count$field);
			}
			if (hasBandJinziPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, band_jinzi_price$field);
			}
			if (hasJinziPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jinzi_price$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var upgrade_goods$count:uint = 0;
			var upgrade_goods_count$count:uint = 0;
			var band_jinzi_price$count:uint = 0;
			var jinzi_price$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (upgrade_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeGoodsInfoProto.upgradeGoods cannot be set twice.');
					}
					++upgrade_goods$count;
					this.upgradeGoods = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.substituteGoods);
						break;
					}
					this.substituteGoods.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 3:
					if (upgrade_goods_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeGoodsInfoProto.upgradeGoodsCount cannot be set twice.');
					}
					++upgrade_goods_count$count;
					this.upgradeGoodsCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (band_jinzi_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeGoodsInfoProto.bandJinziPrice cannot be set twice.');
					}
					++band_jinzi_price$count;
					this.bandJinziPrice = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (jinzi_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeGoodsInfoProto.jinziPrice cannot be set twice.');
					}
					++jinzi_price$count;
					this.jinziPrice = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
