package org.mokylin.skin.app.friend
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjiao_xia;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjiao_you;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendBestHeaderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Num:feathers.controls.Label;

		public var btn_xia:feathers.controls.Button;

		public var btn_you:feathers.controls.Button;

		public var titleName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendBestHeaderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 276;
			this.elementsContent = [titleName_i(),Num_i(),btn_you_i(),btn_xia_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			Num = temp;
			temp.name = "Num";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "(1/2)";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 98;
			temp.x = 173;
			temp.y = 2;
			return temp;
		}

		private function btn_xia_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_xia = temp;
			temp.name = "btn_xia";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjiao_xia);
			temp.x = 2;
			temp.y = 5;
			return temp;
		}

		private function btn_you_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_you = temp;
			temp.name = "btn_you";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjiao_you);
			temp.x = 2;
			return temp;
		}

		private function titleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			titleName = temp;
			temp.name = "titleName";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "我的好友";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 101;
			temp.x = 24;
			temp.y = 2;
			return temp;
		}

	}
}