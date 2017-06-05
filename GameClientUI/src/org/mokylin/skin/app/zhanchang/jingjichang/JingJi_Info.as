package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.button.ButtonDui;
	import org.mokylin.skin.component.button.ButtonSkin_jia;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JingJi_Info extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAdd1:feathers.controls.Button;

		public var btnAdd2:feathers.controls.Button;

		public var btnDui:feathers.controls.Button;

		public var lbCiShu:feathers.controls.Label;

		public var lbShengWang:feathers.controls.Label;

		public var lbZhanLi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JingJi_Info()
		{
			super();
			
			this.currentState = "normal";
			this.height = 106;
			this.width = 225;
			this.elementsContent = [__JingJi_Info_UIAsset1_i(),lbCiShu_i(),lbZhanLi_i(),lbShengWang_i(),btnAdd1_i(),btnAdd2_i(),btnDui_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JingJi_Info_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/ban.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnAdd1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAdd1 = temp;
			temp.name = "btnAdd1";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 177;
			temp.y = 15;
			return temp;
		}

		private function btnAdd2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAdd2 = temp;
			temp.name = "btnAdd2";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 177;
			temp.y = 43;
			return temp;
		}

		private function btnDui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDui = temp;
			temp.name = "btnDui";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonDui;
			temp.x = 177;
			temp.y = 70;
			return temp;
		}

		private function lbCiShu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCiShu = temp;
			temp.name = "lbCiShu";
			temp.text = "剩余次数：$";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 163;
			temp.x = 9;
			temp.y = 17;
			return temp;
		}

		private function lbShengWang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengWang = temp;
			temp.name = "lbShengWang";
			temp.text = "声望点数：$";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 163;
			temp.x = 9;
			temp.y = 71;
			return temp;
		}

		private function lbZhanLi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanLi = temp;
			temp.name = "lbZhanLi";
			temp.text = "我的战力：$";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 163;
			temp.x = 9;
			temp.y = 44;
			return temp;
		}

	}
}