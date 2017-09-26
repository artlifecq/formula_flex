package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.Skill_Personal;
	import org.mokylin.skin.app.banghui.Skill_TongShuai;
	import org.mokylin.skin.app.banghui.button.Button_GeRen;
	import org.mokylin.skin.app.banghui.button.Button_TongShuai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_Skill extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnSkill1:feathers.controls.Radio;

		public var btnSkill2:feathers.controls.Radio;

		public var skinPersonal:feathers.controls.SkinnableContainer;

		public var skinTongShuai:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Skill()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__BangHui_Skill_UIAsset2_i(),__BangHui_Skill_UIAsset3_i(),btnSkill1_i(),btnSkill2_i(),skinPersonal_i(),skinTongShuai_i(),__BangHui_Skill_UIAsset4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BangHui_Skill_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 507;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 782;
			temp.x = 155;
			temp.y = 85;
			return temp;
		}

		private function __BangHui_Skill_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/bg4.png";
			temp.x = 23;
			temp.y = 86;
			return temp;
		}

		private function __BangHui_Skill_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huawen3.png";
			temp.x = 113;
			temp.y = 83;
			return temp;
		}

		private function btnSkill1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnSkill1 = temp;
			temp.name = "btnSkill1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "rdoTeamSkill";
			temp.height = 42;
			temp.styleClass = org.mokylin.skin.app.banghui.button.Button_TongShuai;
			temp.width = 123;
			temp.x = 34;
			temp.y = 118;
			return temp;
		}

		private function btnSkill2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnSkill2 = temp;
			temp.name = "btnSkill2";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "rdoTeamSkill";
			temp.height = 42;
			temp.styleClass = org.mokylin.skin.app.banghui.button.Button_GeRen;
			temp.width = 123;
			temp.x = 34;
			temp.y = 173;
			return temp;
		}

		private function skinPersonal_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinPersonal = temp;
			temp.name = "skinPersonal";
			temp.height = 497;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.Skill_Personal()
			temp.skin = skin
			temp.width = 769;
			temp.x = 160;
			temp.y = 89;
			return temp;
		}

		private function skinTongShuai_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinTongShuai = temp;
			temp.name = "skinTongShuai";
			temp.height = 506;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.Skill_TongShuai()
			temp.skin = skin
			temp.width = 788;
			temp.x = 155;
			temp.y = 83;
			return temp;
		}

	}
}