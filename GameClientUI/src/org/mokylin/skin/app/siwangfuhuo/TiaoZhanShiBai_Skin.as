package org.mokylin.skin.app.siwangfuhuo
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.Erji_panelbg_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TiaoZhanShiBai_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btn_ok:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TiaoZhanShiBai_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 446;
			this.width = 670;
			this.elementsContent = [bg_i(),__TiaoZhanShiBai_Skin_UIAsset1_i(),__TiaoZhanShiBai_Skin_UIAsset2_i(),btn_ok_i(),__TiaoZhanShiBai_Skin_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TiaoZhanShiBai_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 205;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 643;
			temp.x = 12;
			temp.y = 168;
			return temp;
		}

		private function __TiaoZhanShiBai_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/siwangfuhuo/batty.png";
			temp.x = 12;
			temp.y = 104;
			return temp;
		}

		private function __TiaoZhanShiBai_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/siwangfuhuo/tzsb.png";
			temp.x = 188;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 415;
			var skin:StateSkin = new org.mokylin.skin.common.Erji_panelbg_Skin()
			temp.skin = skin
			temp.width = 670;
			temp.x = 0;
			temp.y = 31;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "知道了";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 101;
			temp.x = 280;
			temp.y = 390;
			return temp;
		}

	}
}