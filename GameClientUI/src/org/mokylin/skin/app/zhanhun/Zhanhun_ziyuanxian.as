package org.mokylin.skin.app.zhanhun
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanhun.Zhanhun_ItemBtn;
	import org.mokylin.skin.component.button.ButtonSkin_send;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhanhun_ziyuanxian extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_over:feathers.controls.Button;

		public var btn_send:feathers.controls.Button;

		public var lb_cishu:feathers.controls.Label;

		public var lb_jinyan:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhanhun_ziyuanxian()
		{
			super();
			
			this.currentState = "normal";
			this.height = 29;
			this.width = 265;
			this.elementsContent = [btn_over_i(),lb_name_i(),lb_cishu_i(),lb_jinyan_i(),btn_send_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_over_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_over = temp;
			temp.name = "btn_over";
			temp.styleClass = org.mokylin.skin.app.zhanhun.Zhanhun_ItemBtn;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_send_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_send = temp;
			temp.name = "btn_send";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_send;
			temp.x = 235;
			temp.y = 3;
			return temp;
		}

		private function lb_cishu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_cishu = temp;
			temp.name = "lb_cishu";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "0/9";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 54;
			temp.x = 128;
			temp.y = 7;
			return temp;
		}

		private function lb_jinyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jinyan = temp;
			temp.name = "lb_jinyan";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "5点";
			temp.textAlign = "center";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 44;
			temp.x = 197;
			temp.y = 7;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "跨服皇城争霸战";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 3;
			temp.y = 7;
			return temp;
		}

	}
}