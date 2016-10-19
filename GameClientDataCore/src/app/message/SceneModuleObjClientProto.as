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
	import app.message.SceneModuleObjClientProto.HeroPKStatusProto;
	import app.message.HeroReliveClientProto;
	import app.message.HeroLevelProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SceneModuleObjClientProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneModuleObjClientProto.scene_id", "sceneId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSceneId():void {
			hasField$0 &= 0xfffffffe;
			scene_id$field = new int();
		}

		public function get hasSceneId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sceneId(value:int):void {
			hasField$0 |= 0x1;
			scene_id$field = value;
		}

		public function get sceneId():int {
			return scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_RELIVE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SceneModuleObjClientProto.hero_relive", "heroRelive", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.HeroReliveClientProto; });

		private var hero_relive$field:app.message.HeroReliveClientProto;

		public function clearHeroRelive():void {
			hero_relive$field = null;
		}

		public function get hasHeroRelive():Boolean {
			return hero_relive$field != null;
		}

		public function set heroRelive(value:app.message.HeroReliveClientProto):void {
			hero_relive$field = value;
		}

		public function get heroRelive():app.message.HeroReliveClientProto {
			return hero_relive$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SceneModuleObjClientProto.total_stat", "totalStat", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

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
		public static const PK_STATUS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SceneModuleObjClientProto.pk_status", "pkStatus", (45 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SceneModuleObjClientProto.HeroPKStatusProto; });

		private var pk_status$field:app.message.SceneModuleObjClientProto.HeroPKStatusProto;

		public function clearPkStatus():void {
			pk_status$field = null;
		}

		public function get hasPkStatus():Boolean {
			return pk_status$field != null;
		}

		public function set pkStatus(value:app.message.SceneModuleObjClientProto.HeroPKStatusProto):void {
			pk_status$field = value;
		}

		public function get pkStatus():app.message.SceneModuleObjClientProto.HeroPKStatusProto {
			return pk_status$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_LEVEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SceneModuleObjClientProto.hero_level", "heroLevel", (46 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.HeroLevelProto; });

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
		public static const FIGHTING_AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.SceneModuleObjClientProto.fighting_amount", "fightingAmount", (16 << 3) | com.netease.protobuf.WireType.VARINT);

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
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_id$field);
			}
			if (hasHeroRelive) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, hero_relive$field);
			}
			if (hasTotalStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, total_stat$field);
			}
			if (hasPkStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 45);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, pk_status$field);
			}
			if (hasHeroLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 46);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, hero_level$field);
			}
			if (hasFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, fighting_amount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var scene_id$count:uint = 0;
			var hero_relive$count:uint = 0;
			var total_stat$count:uint = 0;
			var pk_status$count:uint = 0;
			var hero_level$count:uint = 0;
			var fighting_amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjClientProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 1:
					if (hero_relive$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjClientProto.heroRelive cannot be set twice.');
					}
					++hero_relive$count;
					this.heroRelive = new app.message.HeroReliveClientProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.heroRelive);
					break;
				case 15:
					if (total_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjClientProto.totalStat cannot be set twice.');
					}
					++total_stat$count;
					this.totalStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.totalStat);
					break;
				case 45:
					if (pk_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjClientProto.pkStatus cannot be set twice.');
					}
					++pk_status$count;
					this.pkStatus = new app.message.SceneModuleObjClientProto.HeroPKStatusProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.pkStatus);
					break;
				case 46:
					if (hero_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjClientProto.heroLevel cannot be set twice.');
					}
					++hero_level$count;
					this.heroLevel = new app.message.HeroLevelProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.heroLevel);
					break;
				case 16:
					if (fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneModuleObjClientProto.fightingAmount cannot be set twice.');
					}
					++fighting_amount$count;
					this.fightingAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
