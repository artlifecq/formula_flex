package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NormalUsableDataProto;
	import app.message.PackageGoodsDataProto;
	import app.message.JinziPackageDataProto;
	import app.message.RefinedStatGoodsDataProto;
	import app.message.TransportationDataProto;
	import app.message.SummonTokenGoodsDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UsableGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CD_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.UsableGoodsDataProto.cd_type", "cdType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cd_type$field:int;

		private var hasField$0:uint = 0;

		public function clearCdType():void {
			hasField$0 &= 0xfffffffe;
			cd_type$field = new int();
		}

		public function get hasCdType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cdType(value:int):void {
			hasField$0 |= 0x1;
			cd_type$field = value;
		}

		public function get cdType():int {
			return cd_type$field;
		}

		/**
		 *  @private
		 */
		public static const CD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.UsableGoodsDataProto.cd", "cd", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cd$field:int;

		public function clearCd():void {
			hasField$0 &= 0xfffffffd;
			cd$field = new int();
		}

		public function get hasCd():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set cd(value:int):void {
			hasField$0 |= 0x2;
			cd$field = value;
		}

		public function get cd():int {
			return cd$field;
		}

		/**
		 *  @private
		 */
		public static const BULK_USEABLE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.UsableGoodsDataProto.bulk_useable", "bulkUseable", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bulk_useable$field:Boolean;

		public function clearBulkUseable():void {
			hasField$0 &= 0xfffffffb;
			bulk_useable$field = new Boolean();
		}

		public function get hasBulkUseable():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set bulkUseable(value:Boolean):void {
			hasField$0 |= 0x4;
			bulk_useable$field = value;
		}

		public function get bulkUseable():Boolean {
			return bulk_useable$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SET_SHORTCUT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.UsableGoodsDataProto.can_set_shortcut", "canSetShortcut", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_set_shortcut$field:Boolean;

		public function clearCanSetShortcut():void {
			hasField$0 &= 0xfffffff7;
			can_set_shortcut$field = new Boolean();
		}

		public function get hasCanSetShortcut():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set canSetShortcut(value:Boolean):void {
			hasField$0 |= 0x8;
			can_set_shortcut$field = value;
		}

		public function get canSetShortcut():Boolean {
			return can_set_shortcut$field;
		}

		/**
		 *  @private
		 */
		public static const IS_SUGGESTION:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.UsableGoodsDataProto.is_suggestion", "isSuggestion", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_suggestion$field:Boolean;

		public function clearIsSuggestion():void {
			hasField$0 &= 0xffffffef;
			is_suggestion$field = new Boolean();
		}

		public function get hasIsSuggestion():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isSuggestion(value:Boolean):void {
			hasField$0 |= 0x10;
			is_suggestion$field = value;
		}

		public function get isSuggestion():Boolean {
			return is_suggestion$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.UsableGoodsDataProto.normal", "normal", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NormalUsableDataProto; });

		private var normal$field:app.message.NormalUsableDataProto;

		public function clearNormal():void {
			normal$field = null;
		}

		public function get hasNormal():Boolean {
			return normal$field != null;
		}

		public function set normal(value:app.message.NormalUsableDataProto):void {
			normal$field = value;
		}

		public function get normal():app.message.NormalUsableDataProto {
			return normal$field;
		}

		/**
		 *  @private
		 */
		public static const TRANSPORTATION:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.UsableGoodsDataProto.transportation", "transportation", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TransportationDataProto; });

		private var transportation$field:app.message.TransportationDataProto;

		public function clearTransportation():void {
			transportation$field = null;
		}

		public function get hasTransportation():Boolean {
			return transportation$field != null;
		}

		public function set transportation(value:app.message.TransportationDataProto):void {
			transportation$field = value;
		}

		public function get transportation():app.message.TransportationDataProto {
			return transportation$field;
		}

		/**
		 *  @private
		 */
		public static const JINZI_PACKAGE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.UsableGoodsDataProto.jinzi_package", "jinziPackage", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.JinziPackageDataProto; });

		private var jinzi_package$field:app.message.JinziPackageDataProto;

		public function clearJinziPackage():void {
			jinzi_package$field = null;
		}

		public function get hasJinziPackage():Boolean {
			return jinzi_package$field != null;
		}

		public function set jinziPackage(value:app.message.JinziPackageDataProto):void {
			jinzi_package$field = value;
		}

		public function get jinziPackage():app.message.JinziPackageDataProto {
			return jinzi_package$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.UsableGoodsDataProto.refine_goods", "refineGoods", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.RefinedStatGoodsDataProto; });

		private var refine_goods$field:app.message.RefinedStatGoodsDataProto;

		public function clearRefineGoods():void {
			refine_goods$field = null;
		}

		public function get hasRefineGoods():Boolean {
			return refine_goods$field != null;
		}

		public function set refineGoods(value:app.message.RefinedStatGoodsDataProto):void {
			refine_goods$field = value;
		}

		public function get refineGoods():app.message.RefinedStatGoodsDataProto {
			return refine_goods$field;
		}

		/**
		 *  @private
		 */
		public static const SUMMON_TOKEN:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.UsableGoodsDataProto.summon_token", "summonToken", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SummonTokenGoodsDataProto; });

		private var summon_token$field:app.message.SummonTokenGoodsDataProto;

		public function clearSummonToken():void {
			summon_token$field = null;
		}

		public function get hasSummonToken():Boolean {
			return summon_token$field != null;
		}

		public function set summonToken(value:app.message.SummonTokenGoodsDataProto):void {
			summon_token$field = value;
		}

		public function get summonToken():app.message.SummonTokenGoodsDataProto {
			return summon_token$field;
		}

		/**
		 *  @private
		 */
		public static const PACKAGE_GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.UsableGoodsDataProto.package_goods", "packageGoods", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PackageGoodsDataProto; });

		private var package_goods$field:app.message.PackageGoodsDataProto;

		public function clearPackageGoods():void {
			package_goods$field = null;
		}

		public function get hasPackageGoods():Boolean {
			return package_goods$field != null;
		}

		public function set packageGoods(value:app.message.PackageGoodsDataProto):void {
			package_goods$field = value;
		}

		public function get packageGoods():app.message.PackageGoodsDataProto {
			return package_goods$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCdType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cd_type$field);
			}
			if (hasCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cd$field);
			}
			if (hasBulkUseable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, bulk_useable$field);
			}
			if (hasCanSetShortcut) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_set_shortcut$field);
			}
			if (hasIsSuggestion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_suggestion$field);
			}
			if (hasNormal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, normal$field);
			}
			if (hasTransportation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, transportation$field);
			}
			if (hasJinziPackage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, jinzi_package$field);
			}
			if (hasRefineGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, refine_goods$field);
			}
			if (hasSummonToken) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, summon_token$field);
			}
			if (hasPackageGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, package_goods$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cd_type$count:uint = 0;
			var cd$count:uint = 0;
			var bulk_useable$count:uint = 0;
			var can_set_shortcut$count:uint = 0;
			var is_suggestion$count:uint = 0;
			var normal$count:uint = 0;
			var transportation$count:uint = 0;
			var jinzi_package$count:uint = 0;
			var refine_goods$count:uint = 0;
			var summon_token$count:uint = 0;
			var package_goods$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cd_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.cdType cannot be set twice.');
					}
					++cd_type$count;
					this.cdType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.cd cannot be set twice.');
					}
					++cd$count;
					this.cd = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (bulk_useable$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.bulkUseable cannot be set twice.');
					}
					++bulk_useable$count;
					this.bulkUseable = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (can_set_shortcut$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.canSetShortcut cannot be set twice.');
					}
					++can_set_shortcut$count;
					this.canSetShortcut = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 5:
					if (is_suggestion$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.isSuggestion cannot be set twice.');
					}
					++is_suggestion$count;
					this.isSuggestion = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 10:
					if (normal$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.normal cannot be set twice.');
					}
					++normal$count;
					this.normal = new app.message.NormalUsableDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.normal);
					break;
				case 11:
					if (transportation$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.transportation cannot be set twice.');
					}
					++transportation$count;
					this.transportation = new app.message.TransportationDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.transportation);
					break;
				case 12:
					if (jinzi_package$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.jinziPackage cannot be set twice.');
					}
					++jinzi_package$count;
					this.jinziPackage = new app.message.JinziPackageDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.jinziPackage);
					break;
				case 13:
					if (refine_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.refineGoods cannot be set twice.');
					}
					++refine_goods$count;
					this.refineGoods = new app.message.RefinedStatGoodsDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.refineGoods);
					break;
				case 14:
					if (summon_token$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.summonToken cannot be set twice.');
					}
					++summon_token$count;
					this.summonToken = new app.message.SummonTokenGoodsDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.summonToken);
					break;
				case 15:
					if (package_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: UsableGoodsDataProto.packageGoods cannot be set twice.');
					}
					++package_goods$count;
					this.packageGoods = new app.message.PackageGoodsDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.packageGoods);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
