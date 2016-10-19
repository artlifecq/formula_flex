package org.mokylin.skin.app.trade
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TradeInviteListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var cancel:feathers.controls.Button;

		public var level:feathers.controls.Label;

		public var ok:feathers.controls.Button;

		public var targetName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TradeInviteListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 560;
			this.elementsContent = [bg_i(),ok_i(),cancel_i(),targetName_i(),level_i()];
			
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
			temp.styleName = "ui/common/version_3/L_liebiao/lie_biao_di_2.png";
			temp.width = 560;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			cancel = temp;
			temp.name = "cancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拒 绝";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjianniu);
			temp.color = 0xF9F0CC;
			temp.x = 474;
			temp.y = 2;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.fontSize = 14;
			temp.text = "目标名称";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 187;
			temp.x = 191;
			temp.y = 2;
			return temp;
		}

		private function ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			ok = temp;
			temp.name = "ok";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "接 受";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjianniu);
			temp.color = 0xF9F0CC;
			temp.x = 417;
			temp.y = 2;
			return temp;
		}

		private function targetName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			targetName = temp;
			temp.name = "targetName";
			temp.fontSize = 14;
			temp.text = "目标名称";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 186;
			temp.x = 7;
			temp.y = 1;
			return temp;
		}

	}
}