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
	import app.message.SceneModuleObjOtherProto.OtherHeroPKStatusProto;
	import app.message.HeroLevelProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SceneModuleObjOtherProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LIFE:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SceneModuleObjOtherProto.life", "life", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var life$field:Int64;

		public function clearLife():void {
			life$field = null;
		}

		public function get hasLife():Boolean {
			return life$field != null;
		}

		public function set life(value:Int64):void {
			life$field = value;
		}

		public function get life():Int64 {
			return life$field;
		}

		/**
		 *  @private
		 */
		public static const MANA:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SceneModuleObjOtherProto.mana", "mana", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mana$field:Int64;

		public function clearMana():void {
			mana$field = null;
		}

		public function get hasMana():Boolean {
			return mana$field != null;
		}

		public function set mana(value:Int64):void {
			mana$field = value;
		}

		public function get mana():Int64 {
			return mana$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneModuleObjOtherProto.total_stat", "totalStat", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var total_stat$field:app.message.SpriteStatProto;

		public function clearTotalStat():void {
			total_stat$field = null;
		}

		public function get hasTotalStat():Boolean {
			return total_stat$field != null;
		}

		public function set totalStat(value:app.message.SpriteStatProto):void {
			total_stat$field = value;
		}

		public function get totalStat():app.message.SpriteStatProto {
			return total_stat$field;
		}

		/**
		 *  @private
		 */
		public static const PK_STATUS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneModuleObjOtherProto.pk_status", "pkStatus", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SceneModuleObjOtherProto.OtherHeroPKStatusProto; });

		private var pk_status$field:app.message.SceneModuleObjOtherProto.OtherHeroPKStatusProto;

		public function clearPkStatus():void {
			pk_status$field = null;
		}

		public function get hasPkStatus():Boolean {
			return pk_status$field != null;
		}

		public function set pkStatus(value:app.message.SceneModuleObjOtherProto.OtherHeroPKStatusProto):void {
			pk_status$field = value;
		}

		public function get pkStatus():app.message.SceneModuleObjOtherProto.OtherHeroPKStatusProto {
			return pk_status$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_LEVEL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneModuleObjOtherProto.hero_level", "heroLevel", (46 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.HeroLevelProto; });

		private var hero_level$field:app.message.HeroLevelProto;

		public function clearHeroLevel():void {
			hero_level$field = null;
		}

		public function get hasHeroLevel():Boolean {
			return hero_level$field != null;
		}

		public function set heroLevel(value:app.message.HeroLevelProto):void {
			hero_level$field = value;
		}

		public function get heroLevel():app.message.HeroLevelProto {
			return hero_level$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHTING_AMOUNT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SceneModuleObjOtherProto.fighting_amount", "fightingAmount", (16 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLife) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, life$field);
			}
			if (hasMana) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, mana$field);
			}
			if (hasTotalStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, total_stat$field);
			}
			if (hasPkStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, pk_status$field);
			}
			if (hasHeroLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 46);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, hero_level$field);
			}
			if (hasFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, fighting_amount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var life$count:uint = 0;
			var mana$count:uint = 0;
			var total_stat$count:uint = 0;
			var pk_status$count:uint = 0;
			var hero_level$count:uint = 0;
			var fighting_amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 13:
					if (life$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjOtherProto.life cannot be set twice.');
					}
					++life$count;
					this.life = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 14:
					if (mana$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjOtherProto.mana cannot be set twice.');
					}
					++mana$count;
					this.mana = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (total_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjOtherProto.totalStat cannot be set twice.');
					}
					++total_stat$count;
					this.totalStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.totalStat);
					break;
				case 31:
					if (pk_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjOtherProto.pkStatus cannot be set twice.');
					}
					++pk_status$count;
					this.pkStatus = new app.message.SceneModuleObjOtherProto.OtherHeroPKStatusProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.pkStatus);
					break;
				case 46:
					if (hero_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjOtherProto.heroLevel cannot be set twice.');
					}
					++hero_level$count;
					this.heroLevel = new app.message.HeroLevelProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.heroLevel);
					break;
				case 16:
					if (fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjOtherProto.fightingAmount cannot be set twice.');
					}
					++fighting_amount$count;
					this.fightingAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
