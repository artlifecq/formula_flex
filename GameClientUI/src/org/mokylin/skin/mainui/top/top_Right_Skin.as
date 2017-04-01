package org.mokylin.skin.mainui.top
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_top_GM;
	import org.mokylin.skin.component.button.ButtonSkin_top_qiandao;
	import org.mokylin.skin.component.button.ButtonSkin_top_shengyin;
	import org.mokylin.skin.component.button.ButtonSkin_top_shezhi;
	import org.mokylin.skin.component.button.ButtonSkin_top_suo;
	import org.mokylin.skin.component.button.ButtonSkin_top_youjian;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class top_Right_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var UI_net:feathers.controls.UIAsset;

		public var btn_GM:feathers.controls.Button;

		public var btn_lock:feathers.controls.Button;

		public var btn_mail:feathers.controls.Button;

		public var btn_set:feathers.controls.Button;

		public var btn_sound:feathers.controls.Button;

		public var btn_write:feathers.controls.Button;

		public var txt_times:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function top_Right_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 242;
			this.elementsContent = [btn_mail_i(),btn_write_i(),btn_lock_i(),btn_GM_i(),btn_sound_i(),btn_set_i(),UI_net_i(),txt_times_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function UI_net_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UI_net = temp;
			temp.name = "UI_net";
			temp.styleName = "ui/mainui/top/down.png";
			temp.width = 28;
			temp.x = 164;
			temp.y = 2;
			return temp;
		}

		private function btn_GM_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_GM = temp;
			temp.name = "btn_GM";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_top_GM;
			temp.width = 28;
			temp.x = 84;
			temp.y = 3;
			return temp;
		}

		private function btn_lock_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_lock = temp;
			temp.name = "btn_lock";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_top_suo;
			temp.x = 56;
			temp.y = 1;
			return temp;
		}

		private function btn_mail_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_mail = temp;
			temp.name = "btn_mail";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_top_youjian;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function btn_set_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_set = temp;
			temp.name = "btn_set";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_top_shezhi;
			temp.width = 28;
			temp.x = 139;
			temp.y = 3;
			return temp;
		}

		private function btn_sound_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_sound = temp;
			temp.name = "btn_sound";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_top_shengyin;
			temp.width = 22;
			temp.x = 113;
			temp.y = 4;
			return temp;
		}

		private function btn_write_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_write = temp;
			temp.name = "btn_write";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_top_qiandao;
			temp.x = 30;
			temp.y = 1;
			return temp;
		}

		private function txt_times_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_times = temp;
			temp.name = "txt_times";
			temp.height = 22;
			temp.letterSpacing = NaN;
			temp.fontSize = 16;
			temp.text = "23:28";
			temp.color = 0x8B7D69;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 194;
			temp.y = 5;
			return temp;
		}

	}
}