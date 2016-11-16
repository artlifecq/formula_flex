package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MountModuleObjClientProto;
	import app.message.GoodsContainerModuleObjOtherProto;
	import app.message.FamilyModuleObjOtherProto;
	import app.message.CountryModuleObjOtherProto;
	import app.message.HeroBasicOtherProto;
	import app.message.VipModuleObjOtherProto;
	import app.message.SceneModuleObjOtherProto;
	import app.message.AchievementAndNickNameModuleObjProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OtherHeroProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_BASIC:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.hero_basic", "heroBasic", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.HeroBasicOtherProto; });

		private var hero_basic$field:app.message.HeroBasicOtherProto;

		public function clearHeroBasic():void {
			hero_basic$field = null;
		}

		public function get hasHeroBasic():Boolean {
			return hero_basic$field != null;
		}

		public function set heroBasic(value:app.message.HeroBasicOtherProto):void {
			hero_basic$field = value;
		}

		public function get heroBasic():app.message.HeroBasicOtherProto {
			return hero_basic$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_CONTAINER_MODULE_OBJ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.goods_container_module_obj", "goodsContainerModuleObj", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsContainerModuleObjOtherProto; });

		private var goods_container_module_obj$field:app.message.GoodsContainerModuleObjOtherProto;

		public function clearGoodsContainerModuleObj():void {
			goods_container_module_obj$field = null;
		}

		public function get hasGoodsContainerModuleObj():Boolean {
			return goods_container_module_obj$field != null;
		}

		public function set goodsContainerModuleObj(value:app.message.GoodsContainerModuleObjOtherProto):void {
			goods_container_module_obj$field = value;
		}

		public function get goodsContainerModuleObj():app.message.GoodsContainerModuleObjOtherProto {
			return goods_container_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_MODULE_OBJ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.family_module_obj", "familyModuleObj", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyModuleObjOtherProto; });

		private var family_module_obj$field:app.message.FamilyModuleObjOtherProto;

		public function clearFamilyModuleObj():void {
			family_module_obj$field = null;
		}

		public function get hasFamilyModuleObj():Boolean {
			return family_module_obj$field != null;
		}

		public function set familyModuleObj(value:app.message.FamilyModuleObjOtherProto):void {
			family_module_obj$field = value;
		}

		public function get familyModuleObj():app.message.FamilyModuleObjOtherProto {
			return family_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_MODULE_OBJ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.scene_module_obj", "sceneModuleObj", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SceneModuleObjOtherProto; });

		private var scene_module_obj$field:app.message.SceneModuleObjOtherProto;

		public function clearSceneModuleObj():void {
			scene_module_obj$field = null;
		}

		public function get hasSceneModuleObj():Boolean {
			return scene_module_obj$field != null;
		}

		public function set sceneModuleObj(value:app.message.SceneModuleObjOtherProto):void {
			scene_module_obj$field = value;
		}

		public function get sceneModuleObj():app.message.SceneModuleObjOtherProto {
			return scene_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_MODULE_OBJ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.vip_module_obj", "vipModuleObj", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.VipModuleObjOtherProto; });

		private var vip_module_obj$field:app.message.VipModuleObjOtherProto;

		public function clearVipModuleObj():void {
			vip_module_obj$field = null;
		}

		public function get hasVipModuleObj():Boolean {
			return vip_module_obj$field != null;
		}

		public function set vipModuleObj(value:app.message.VipModuleObjOtherProto):void {
			vip_module_obj$field = value;
		}

		public function get vipModuleObj():app.message.VipModuleObjOtherProto {
			return vip_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENT_AND_NICKNAME_MODULE_OBJ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.achievement_and_nickname_module_obj", "achievementAndNicknameModuleObj", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AchievementAndNickNameModuleObjProto; });

		private var achievement_and_nickname_module_obj$field:app.message.AchievementAndNickNameModuleObjProto;

		public function clearAchievementAndNicknameModuleObj():void {
			achievement_and_nickname_module_obj$field = null;
		}

		public function get hasAchievementAndNicknameModuleObj():Boolean {
			return achievement_and_nickname_module_obj$field != null;
		}

		public function set achievementAndNicknameModuleObj(value:app.message.AchievementAndNickNameModuleObjProto):void {
			achievement_and_nickname_module_obj$field = value;
		}

		public function get achievementAndNicknameModuleObj():app.message.AchievementAndNickNameModuleObjProto {
			return achievement_and_nickname_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_MODULE_OBJ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.mount_module_obj", "mountModuleObj", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountModuleObjClientProto; });

		private var mount_module_obj$field:app.message.MountModuleObjClientProto;

		public function clearMountModuleObj():void {
			mount_module_obj$field = null;
		}

		public function get hasMountModuleObj():Boolean {
			return mount_module_obj$field != null;
		}

		public function set mountModuleObj(value:app.message.MountModuleObjClientProto):void {
			mount_module_obj$field = value;
		}

		public function get mountModuleObj():app.message.MountModuleObjClientProto {
			return mount_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_MODULE_OBJ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OtherHeroProto.country_module_obj", "countryModuleObj", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryModuleObjOtherProto; });

		private var country_module_obj$field:app.message.CountryModuleObjOtherProto;

		public function clearCountryModuleObj():void {
			country_module_obj$field = null;
		}

		public function get hasCountryModuleObj():Boolean {
			return country_module_obj$field != null;
		}

		public function set countryModuleObj(value:app.message.CountryModuleObjOtherProto):void {
			country_module_obj$field = value;
		}

		public function get countryModuleObj():app.message.CountryModuleObjOtherProto {
			return country_module_obj$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroBasic) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, hero_basic$field);
			}
			if (hasGoodsContainerModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, goods_container_module_obj$field);
			}
			if (hasFamilyModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, family_module_obj$field);
			}
			if (hasSceneModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, scene_module_obj$field);
			}
			if (hasVipModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, vip_module_obj$field);
			}
			if (hasAchievementAndNicknameModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, achievement_and_nickname_module_obj$field);
			}
			if (hasMountModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_module_obj$field);
			}
			if (hasCountryModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, country_module_obj$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hero_basic$count:uint = 0;
			var goods_container_module_obj$count:uint = 0;
			var family_module_obj$count:uint = 0;
			var scene_module_obj$count:uint = 0;
			var vip_module_obj$count:uint = 0;
			var achievement_and_nickname_module_obj$count:uint = 0;
			var mount_module_obj$count:uint = 0;
			var country_module_obj$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hero_basic$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.heroBasic cannot be set twice.');
					}
					++hero_basic$count;
					this.heroBasic = new app.message.HeroBasicOtherProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.heroBasic);
					break;
				case 20:
					if (goods_container_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.goodsContainerModuleObj cannot be set twice.');
					}
					++goods_container_module_obj$count;
					this.goodsContainerModuleObj = new app.message.GoodsContainerModuleObjOtherProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.goodsContainerModuleObj);
					break;
				case 21:
					if (family_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.familyModuleObj cannot be set twice.');
					}
					++family_module_obj$count;
					this.familyModuleObj = new app.message.FamilyModuleObjOtherProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.familyModuleObj);
					break;
				case 22:
					if (scene_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.sceneModuleObj cannot be set twice.');
					}
					++scene_module_obj$count;
					this.sceneModuleObj = new app.message.SceneModuleObjOtherProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.sceneModuleObj);
					break;
				case 23:
					if (vip_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.vipModuleObj cannot be set twice.');
					}
					++vip_module_obj$count;
					this.vipModuleObj = new app.message.VipModuleObjOtherProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.vipModuleObj);
					break;
				case 24:
					if (achievement_and_nickname_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.achievementAndNicknameModuleObj cannot be set twice.');
					}
					++achievement_and_nickname_module_obj$count;
					this.achievementAndNicknameModuleObj = new app.message.AchievementAndNickNameModuleObjProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.achievementAndNicknameModuleObj);
					break;
				case 25:
					if (mount_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.mountModuleObj cannot be set twice.');
					}
					++mount_module_obj$count;
					this.mountModuleObj = new app.message.MountModuleObjClientProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountModuleObj);
					break;
				case 26:
					if (country_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroProto.countryModuleObj cannot be set twice.');
					}
					++country_module_obj$count;
					this.countryModuleObj = new app.message.CountryModuleObjOtherProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.countryModuleObj);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
