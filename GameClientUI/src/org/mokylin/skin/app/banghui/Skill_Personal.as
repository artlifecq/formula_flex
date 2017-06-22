package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.ProSkill_Item;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Skill_Personal extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbGongxian:feathers.controls.Label;

		public var lbLevel:feathers.controls.Label;

		public var skinBaoji:feathers.controls.SkinnableContainer;

		public var skinBishan:feathers.controls.SkinnableContainer;

		public var skinFangyu:feathers.controls.SkinnableContainer;

		public var skinGongji:feathers.controls.SkinnableContainer;

		public var skinMingzhong:feathers.controls.SkinnableContainer;

		public var skinShengmin:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Skill_Personal()
		{
			super();
			
			this.currentState = "normal";
			this.height = 495;
			this.width = 769;
			this.elementsContent = [skinGongji_i(),skinFangyu_i(),skinShengmin_i(),skinMingzhong_i(),skinBishan_i(),skinBaoji_i(),__Skill_Personal_UIAsset1_i(),__Skill_Personal_Label1_i(),lbLevel_i(),__Skill_Personal_Label2_i(),lbGongxian_i(),__Skill_Personal_Label3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Skill_Personal_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派等级：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 19;
			temp.y = 470;
			return temp;
		}

		private function __Skill_Personal_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派贡献：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 126;
			temp.y = 470;
			return temp;
		}

		private function __Skill_Personal_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "退出帮派后，个人技能等级不会清零";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 513;
			temp.y = 470;
			return temp;
		}

		private function __Skill_Personal_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/dibg2.png";
			temp.x = 1;
			temp.y = 460;
			return temp;
		}

		private function lbGongxian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGongxian = temp;
			temp.name = "lbGongxian";
			temp.text = "9999999";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 84;
			temp.x = 200;
			temp.y = 470;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "100";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 39;
			temp.x = 93;
			temp.y = 470;
			return temp;
		}

		private function skinBaoji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBaoji = temp;
			temp.name = "skinBaoji";
			temp.height = 230;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ProSkill_Item()
			temp.skin = skin
			temp.width = 257;
			temp.x = 512;
			temp.y = 230;
			return temp;
		}

		private function skinBishan_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBishan = temp;
			temp.name = "skinBishan";
			temp.height = 230;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ProSkill_Item()
			temp.skin = skin
			temp.width = 257;
			temp.x = 256;
			temp.y = 230;
			return temp;
		}

		private function skinFangyu_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFangyu = temp;
			temp.name = "skinFangyu";
			temp.height = 230;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ProSkill_Item()
			temp.skin = skin
			temp.width = 257;
			temp.x = 256;
			temp.y = 0;
			return temp;
		}

		private function skinGongji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinGongji = temp;
			temp.name = "skinGongji";
			temp.height = 230;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ProSkill_Item()
			temp.skin = skin
			temp.width = 257;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function skinMingzhong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinMingzhong = temp;
			temp.name = "skinMingzhong";
			temp.height = 230;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ProSkill_Item()
			temp.skin = skin
			temp.width = 257;
			temp.x = 0;
			temp.y = 230;
			return temp;
		}

		private function skinShengmin_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinShengmin = temp;
			temp.name = "skinShengmin";
			temp.height = 230;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ProSkill_Item()
			temp.skin = skin
			temp.width = 257;
			temp.x = 512;
			temp.y = 0;
			return temp;
		}

	}
}