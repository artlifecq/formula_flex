package org.mokylin.skin.app.familyWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.text.TextInput3Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyWarBidSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bid:feathers.controls.Button;

		public var bid0:feathers.controls.Button;

		public var bidNum:feathers.controls.TextInput;

		public var closeBtn:feathers.controls.Button;

		public var lingpai:feathers.controls.Label;

		public var nowBidNum:feathers.controls.Label;

		public var nowBidRank:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarBidSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FamilyWarBidSkin_UIAsset1_i(),__FamilyWarBidSkin_UIAsset2_i(),closeBtn_i(),__FamilyWarBidSkin_UIAsset3_i(),__FamilyWarBidSkin_Label1_i(),__FamilyWarBidSkin_Label2_i(),lingpai_i(),__FamilyWarBidSkin_Label3_i(),nowBidRank_i(),__FamilyWarBidSkin_Label4_i(),nowBidNum_i(),bid_i(),bid0_i(),bidNum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyWarBidSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 18;
			temp.text = "提高竞价";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 104;
			temp.y = 8;
			return temp;
		}

		private function __FamilyWarBidSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "当前剩余繁荣度：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 42;
			temp.y = 70;
			return temp;
		}

		private function __FamilyWarBidSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "当前竞价名次：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 42;
			temp.y = 150;
			return temp;
		}

		private function __FamilyWarBidSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "当前竞价：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 212;
			temp.y = 150;
			return temp;
		}

		private function __FamilyWarBidSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 250;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 371;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FamilyWarBidSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 346;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function __FamilyWarBidSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 142;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 327;
			temp.x = 23;
			temp.y = 55;
			return temp;
		}

		private function bid0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			bid0 = temp;
			temp.name = "bid0";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取  消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_getequip;
			temp.color = 0xF9F0CC;
			temp.width = 65;
			temp.x = 215;
			temp.y = 207;
			return temp;
		}

		private function bidNum_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			bidNum = temp;
			temp.name = "bidNum";
			temp.height = 27;
			temp.prompt = "aaa";
			temp.restrict = "1234567890";
			temp.styleClass = org.mokylin.skin.component.text.TextInput3Skin;
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 259;
			temp.x = 61;
			temp.y = 106;
			return temp;
		}

		private function bid_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			bid = temp;
			temp.name = "bid";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确  定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_getequip;
			temp.color = 0xF9F0CC;
			temp.width = 65;
			temp.x = 85;
			temp.y = 207;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close_3;
			temp.x = 332;
			temp.y = 4;
			return temp;
		}

		private function lingpai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lingpai = temp;
			temp.name = "lingpai";
			temp.fontSize = 14;
			temp.text = "0";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 187;
			temp.x = 150;
			temp.y = 70;
			return temp;
		}

		private function nowBidNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nowBidNum = temp;
			temp.name = "nowBidNum";
			temp.fontSize = 14;
			temp.text = "0";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 292;
			temp.y = 150;
			return temp;
		}

		private function nowBidRank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nowBidRank = temp;
			temp.name = "nowBidRank";
			temp.fontSize = 14;
			temp.text = "0";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 142;
			temp.y = 150;
			return temp;
		}

	}
}