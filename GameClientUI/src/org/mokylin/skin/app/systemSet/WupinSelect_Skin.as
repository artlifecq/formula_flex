package org.mokylin.skin.app.systemSet
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Check;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WupinSelect_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var chk_all:feathers.controls.Check;

		public var chk_cailiao:feathers.controls.Check;

		public var chk_jinbi:feathers.controls.Check;

		public var chk_qita:feathers.controls.Check;

		public var chk_renwu:feathers.controls.Check;

		public var chk_yaopin:feathers.controls.Check;

		public var chk_zhuangbei:feathers.controls.Check;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WupinSelect_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__WupinSelect_Skin_UIAsset1_i(),chk_all_i(),chk_jinbi_i(),chk_yaopin_i(),chk_zhuangbei_i(),chk_cailiao_i(),chk_renwu_i(),chk_qita_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WupinSelect_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 210;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 132;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function chk_all_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_all = temp;
			temp.name = "chk_all";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "全选";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.width = 122;
			temp.x = 8;
			temp.y = 8;
			return temp;
		}

		private function chk_cailiao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_cailiao = temp;
			temp.name = "chk_cailiao";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拾取材料";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.width = 122;
			temp.x = 8;
			temp.y = 121;
			return temp;
		}

		private function chk_jinbi_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jinbi = temp;
			temp.name = "chk_jinbi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拾取金币";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.width = 122;
			temp.x = 8;
			temp.y = 36;
			return temp;
		}

		private function chk_qita_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_qita = temp;
			temp.name = "chk_qita";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拾取其他物品";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.width = 122;
			temp.x = 8;
			temp.y = 179;
			return temp;
		}

		private function chk_renwu_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_renwu = temp;
			temp.name = "chk_renwu";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拾取任务物品";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.width = 122;
			temp.x = 8;
			temp.y = 150;
			return temp;
		}

		private function chk_yaopin_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yaopin = temp;
			temp.name = "chk_yaopin";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拾取药品";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.width = 122;
			temp.x = 8;
			temp.y = 64;
			return temp;
		}

		private function chk_zhuangbei_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_zhuangbei = temp;
			temp.name = "chk_zhuangbei";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拾取装备";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.width = 122;
			temp.x = 8;
			temp.y = 92;
			return temp;
		}

	}
}