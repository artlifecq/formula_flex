package org.mokylin.skin.app.systemSet
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class pingbiset_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var chk_hideAllEffect:feathers.controls.Check;

		public var chk_hideBanghui:feathers.controls.Check;

		public var chk_hideBoss:feathers.controls.Check;

		public var chk_hideChangjing:feathers.controls.Check;

		public var chk_hideOther:feathers.controls.Check;

		public var chk_hideOtherEffect:feathers.controls.Check;

		public var chk_hideShanghai:feathers.controls.Check;

		public var chk_hideShanping:feathers.controls.Check;

		public var chk_hideTianqi:feathers.controls.Check;

		public var chk_hideYinying:feathers.controls.Check;

		public var chk_hideZhendong:feathers.controls.Check;

		public var chk_zidong:feathers.controls.Check;

		public var grp_huamian:feathers.controls.Group;

		public var grp_pingbi:feathers.controls.Group;

		public var grp_xingneng:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function pingbiset_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__pingbiset_Skin_UIAsset1_i(),__pingbiset_Skin_UIAsset2_i(),grp_xingneng_i(),grp_pingbi_i(),grp_huamian_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __pingbiset_Skin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "隐藏所有的技能特效";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 247;
			temp.y = 113;
			return temp;
		}

		private function __pingbiset_Skin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "游戏画面设置";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __pingbiset_Skin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "屏蔽场景特效";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 43;
			return temp;
		}

		private function __pingbiset_Skin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "屏蔽天气特效";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 78;
			return temp;
		}

		private function __pingbiset_Skin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "屏蔽血量过低时的闪屏";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 113;
			return temp;
		}

		private function __pingbiset_Skin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "隐藏阴影效果";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 247;
			temp.y = 43;
			return temp;
		}

		private function __pingbiset_Skin_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "屏蔽屏幕震动";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 247;
			temp.y = 78;
			return temp;
		}

		private function __pingbiset_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "游戏性能设置";
			temp.color = 0xe8c958;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __pingbiset_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启自动优化机制";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 28;
			temp.y = 41;
			return temp;
		}

		private function __pingbiset_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "（自动优化游戏流畅度）";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 140;
			temp.y = 41;
			return temp;
		}

		private function __pingbiset_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "游戏屏蔽设置";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __pingbiset_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "隐藏其他玩家";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 43;
			return temp;
		}

		private function __pingbiset_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "隐藏同帮玩家";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 78;
			return temp;
		}

		private function __pingbiset_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "隐藏其他玩家技能特效";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 113;
			return temp;
		}

		private function __pingbiset_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "隐藏怪物";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 247;
			temp.y = 43;
			return temp;
		}

		private function __pingbiset_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "隐藏伤害数字";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 247;
			temp.y = 78;
			return temp;
		}

		private function __pingbiset_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fen.png";
			temp.x = 17;
			temp.y = 105;
			return temp;
		}

		private function __pingbiset_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fen.png";
			temp.x = 17;
			temp.y = 292;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 470;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function chk_hideAllEffect_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideAllEffect = temp;
			temp.name = "chk_hideAllEffect";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 218;
			temp.y = 110;
			return temp;
		}

		private function chk_hideBanghui_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideBanghui = temp;
			temp.name = "chk_hideBanghui";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 76;
			return temp;
		}

		private function chk_hideBoss_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideBoss = temp;
			temp.name = "chk_hideBoss";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 218;
			temp.y = 42;
			return temp;
		}

		private function chk_hideChangjing_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideChangjing = temp;
			temp.name = "chk_hideChangjing";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 42;
			return temp;
		}

		private function chk_hideOtherEffect_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideOtherEffect = temp;
			temp.name = "chk_hideOtherEffect";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 110;
			return temp;
		}

		private function chk_hideOther_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideOther = temp;
			temp.name = "chk_hideOther";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 42;
			return temp;
		}

		private function chk_hideShanghai_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideShanghai = temp;
			temp.name = "chk_hideShanghai";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 218;
			temp.y = 76;
			return temp;
		}

		private function chk_hideShanping_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideShanping = temp;
			temp.name = "chk_hideShanping";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 110;
			return temp;
		}

		private function chk_hideTianqi_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideTianqi = temp;
			temp.name = "chk_hideTianqi";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 76;
			return temp;
		}

		private function chk_hideYinying_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideYinying = temp;
			temp.name = "chk_hideYinying";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 218;
			temp.y = 42;
			return temp;
		}

		private function chk_hideZhendong_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_hideZhendong = temp;
			temp.name = "chk_hideZhendong";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 218;
			temp.y = 76;
			return temp;
		}

		private function chk_zidong_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_zidong = temp;
			temp.name = "chk_zidong";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 2;
			temp.y = 39;
			return temp;
		}

		private function grp_huamian_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_huamian = temp;
			temp.name = "grp_huamian";
			temp.x = 9;
			temp.y = 320;
			temp.elementsContent = [__pingbiset_Skin_Label11_i(),chk_hideChangjing_i(),chk_hideTianqi_i(),chk_hideShanping_i(),chk_hideYinying_i(),chk_hideZhendong_i(),__pingbiset_Skin_Label12_i(),__pingbiset_Skin_Label13_i(),__pingbiset_Skin_Label14_i(),__pingbiset_Skin_Label15_i(),__pingbiset_Skin_Label16_i()];
			return temp;
		}

		private function grp_pingbi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_pingbi = temp;
			temp.name = "grp_pingbi";
			temp.x = 9;
			temp.y = 129;
			temp.elementsContent = [__pingbiset_Skin_Label4_i(),chk_hideOther_i(),chk_hideBanghui_i(),chk_hideOtherEffect_i(),chk_hideBoss_i(),chk_hideShanghai_i(),chk_hideAllEffect_i(),__pingbiset_Skin_Label5_i(),__pingbiset_Skin_Label6_i(),__pingbiset_Skin_Label7_i(),__pingbiset_Skin_Label8_i(),__pingbiset_Skin_Label9_i(),__pingbiset_Skin_Label10_i()];
			return temp;
		}

		private function grp_xingneng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xingneng = temp;
			temp.name = "grp_xingneng";
			temp.x = 9;
			temp.y = 16;
			temp.elementsContent = [__pingbiset_Skin_Label1_i(),chk_zidong_i(),__pingbiset_Skin_Label2_i(),__pingbiset_Skin_Label3_i()];
			return temp;
		}

	}
}