package app.message.GoodsExchangeRuleConfigProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GoodsExchangeRuleProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COST_GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsExchangeRuleConfigProto.GoodsExchangeRuleProto.cost_goods", "costGoods", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var cost_goods$field:app.message.UpgradeProto;

		public function clearCostGoods():void {
			cost_goods$field = null;
		}

		public function get hasCostGoods():Boolean {
			return cost_goods$field != null;
		}

		public function set costGoods(value:app.message.UpgradeProto):void {
			cost_goods$field = value;
		}

		public function get costGoods():app.message.UpgradeProto {
			return cost_goods$field;
		}

		/**
		 *  @private
		 */
		public static const OBTAIN_GOODS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.GoodsExchangeRuleConfigProto.GoodsExchangeRuleProto.obtain_goods", "obtainGoods", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var obtainGoods:Array = [];

		/**
		 *  @private
		 */
		public static const DETAIL_GOODS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.GoodsExchangeRuleConfigProto.GoodsExchangeRuleProto.detail_goods", "detailGoods", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var detailGoods:Array = [];

		/**
		 *  @private
		 */
		public static const LIMIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsExchangeRuleConfigProto.GoodsExchangeRuleProto.limit", "limit", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var limit$field:int;

		private var hasField$0:uint = 0;

		public function clearLimit():void {
			hasField$0 &= 0xfffffffe;
			limit$field = new int();
		}

		public function get hasLimit():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set limit(value:int):void {
			hasField$0 |= 0x1;
			limit$field = value;
		}

		public function get limit():int {
			return limit$field;
		}

		/**
		 *  @private
		 */
		public static const LIMIT_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsExchangeRuleConfigProto.GoodsExchangeRuleProto.limit_type", "limitType", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var limit_type$field:int;

		public function clearLimitType():void {
			hasField$0 &= 0xfffffffd;
			limit_type$field = new int();
		}

		public function get hasLimitType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set limitType(value:int):void {
			hasField$0 |= 0x2;
			limit_type$field = value;
		}

		public function get limitType():int {
			return limit_type$field;
		}

		/**
		 *  @private
		 */
		public static const REQUIRE_VIP_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsExchangeRuleConfigProto.GoodsExchangeRuleProto.require_vip_level", "requireVipLevel", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var require_vip_level$field:int;

		public function clearRequireVipLevel():void {
			hasField$0 &= 0xfffffffb;
			require_vip_level$field = new int();
		}

		public function get hasRequireVipLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set requireVipLevel(value:int):void {
			hasField$0 |= 0x4;
			require_vip_level$field = value;
		}

		public function get requireVipLevel():int {
			return require_vip_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCostGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, cost_goods$field);
			}
			for (var obtainGoods$index:uint = 0; obtainGoods$index < this.obtainGoods.length; ++obtainGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.obtainGoods[obtainGoods$index]);
			}
			for (var detailGoods$index:uint = 0; detailGoods$index < this.detailGoods.length; ++detailGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.detailGoods[detailGoods$index]);
			}
			if (hasLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, limit$field);
			}
			if (hasLimitType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, limit_type$field);
			}
			if (hasRequireVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, require_vip_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cost_goods$count:uint = 0;
			var limit$count:uint = 0;
			var limit_type$count:uint = 0;
			var require_vip_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (cost_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsExchangeRuleProto.costGoods cannot be set twice.');
					}
					++cost_goods$count;
					this.costGoods = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.costGoods);
					break;
				case 3:
					this.obtainGoods.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				case 4:
					this.detailGoods.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				case 5:
					if (limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsExchangeRuleProto.limit cannot be set twice.');
					}
					++limit$count;
					this.limit = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (limit_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsExchangeRuleProto.limitType cannot be set twice.');
					}
					++limit_type$count;
					this.limitType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (require_vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsExchangeRuleProto.requireVipLevel cannot be set twice.');
					}
					++require_vip_level$count;
					this.requireVipLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
