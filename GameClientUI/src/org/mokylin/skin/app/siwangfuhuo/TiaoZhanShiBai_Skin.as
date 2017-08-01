package org.mokylin.skin.app.siwangfuhuo
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongPanelbg2;
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

		public var lbXiaoshi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TiaoZhanShiBai_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 446;
			this.width = 675;
			this.elementsContent = [bg_i(),__TiaoZhanShiBai_Skin_UIAsset1_i(),__TiaoZhanShiBai_Skin_UIAsset2_i(),btn_ok_i(),__TiaoZhanShiBai_Skin_UIAsset3_i(),lbXiaoshi_i()];
			
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
			temp.x = 16;
			temp.y = 168;
			return temp;
		}

		private function __TiaoZhanShiBai_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/siwangfuhuo/batty.png";
			temp.x = 16;
			temp.y = 104;
			return temp;
		}

		private function __TiaoZhanShiBai_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/siwangfuhuo/tzsb.png";
			temp.x = 193;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 415;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg2()
			temp.skin = skin
			temp.width = 675;
			temp.x = 0;
			temp.y = 23;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "知道了";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 101;
			temp.x = 284;
			temp.y = 390;
			return temp;
		}

		private function lbXiaoshi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaoshi = temp;
			temp.name = "lbXiaoshi";
			temp.text = "10秒后消失";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 163;
			temp.x = 391;
			temp.y = 397;
			return temp;
		}

	}
}