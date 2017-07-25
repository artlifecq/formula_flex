package org.mokylin.skin.app.zhanhun
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.common.ItemBg;
	import org.mokylin.skin.component.button.ButtonSelect_Skin;
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
		public var bg:feathers.controls.SkinnableContainer;

		public var btn_send:feathers.controls.Button;

		public var conOver:feathers.controls.Button;

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
			this.height = 33;
			this.width = 265;
			this.elementsContent = [bg_i(),lb_name_i(),lb_cishu_i(),lb_jinyan_i(),btn_send_i(),conOver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 33;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 265;
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
			temp.x = 223;
			temp.y = 6;
			return temp;
		}

		private function conOver_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			conOver = temp;
			temp.name = "conOver";
			temp.height = 33;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSelect_Skin;
			temp.width = 265;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lb_cishu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_cishu = temp;
			temp.name = "lb_cishu";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "0/9";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 54;
			temp.x = 109;
			temp.y = 8;
			return temp;
		}

		private function lb_jinyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jinyan = temp;
			temp.name = "lb_jinyan";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "5点";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 44;
			temp.x = 181;
			temp.y = 8;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "皇城争霸";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 89;
			temp.x = 27;
			temp.y = 8;
			return temp;
		}

	}
}