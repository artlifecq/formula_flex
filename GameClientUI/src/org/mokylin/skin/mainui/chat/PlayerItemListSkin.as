package org.mokylin.skin.mainui.chat
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PlayerItemListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var closeBtn:feathers.controls.Button;

		public var nameLab:feathers.controls.Label;

		public var recPoint:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PlayerItemListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),nameLab_i(),recPoint_i(),closeBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/version_3/x_xuanzhongkuang/xuan_zhong_1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close2);
			temp.x = 134;
			temp.y = 7;
			return temp;
		}

		private function nameLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameLab = temp;
			temp.name = "nameLab";
			temp.fontSize = 14;
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 5;
			temp.y = 2;
			return temp;
		}

		private function recPoint_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			recPoint = temp;
			temp.name = "recPoint";
			temp.styleName = "ui/common/version_3/B_bujian/ti_shi_hong_di.png";
			temp.x = 119;
			temp.y = 6;
			return temp;
		}

	}
}