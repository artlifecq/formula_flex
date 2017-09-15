package org.mokylin.skin.app.sevenday
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Day_Tips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var lbJinri:feathers.controls.Label;

		public var lbLevel:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbType:feathers.controls.Label;

		public var lbWupin:feathers.controls.Label;

		public var line:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Day_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 347;
			this.width = 196;
			this.elementsContent = [imgBG_i(),__Day_Tips_UIAsset1_i(),icon_i(),line_i(),lbName_i(),__Day_Tips_Label1_i(),__Day_Tips_Label2_i(),lbType_i(),lbLevel_i(),lbMsg_i(),__Day_Tips_Label3_i(),__Day_Tips_Label4_i(),lbTime_i(),lbWupin_i(),lbJinri_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Day_Tips_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "类型：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 13;
			temp.y = 74;
			return temp;
		}

		private function __Day_Tips_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需要等级：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 13;
			temp.y = 97;
			return temp;
		}

		private function __Day_Tips_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "每天限用1次";
			temp.color = 0x14A3F3;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 173;
			temp.x = 12;
			temp.y = 249;
			return temp;
		}

		private function __Day_Tips_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "冷却时间：";
			temp.color = 0x14A3F3;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 89;
			temp.x = 12;
			temp.y = 276;
			return temp;
		}

		private function __Day_Tips_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/sevenday/image/xiaodi.png";
			temp.x = 2;
			temp.y = 5;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/sevenday/image/icon/xiaobaoxiang.png";
			temp.x = 8;
			temp.y = 5;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.bottom = 0;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.top = 0;
			temp.width = 196;
			temp.x = 0;
			return temp;
		}

		private function lbJinri_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJinri = temp;
			temp.name = "lbJinri";
			temp.text = "今日使用次数：0/1";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 156;
			temp.x = 12;
			temp.y = 320;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "1";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 82;
			temp.y = 97;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.text = "使用后可获得以下物品：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 12;
			temp.y = 124;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "超级铜钱宝箱";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 115;
			temp.x = 78;
			temp.y = 29;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "3秒";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 89;
			temp.x = 78;
			temp.y = 276;
			return temp;
		}

		private function lbType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbType = temp;
			temp.name = "lbType";
			temp.text = "超级铜钱宝箱";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 126;
			temp.x = 52;
			temp.y = 74;
			return temp;
		}

		private function lbWupin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbWupin = temp;
			temp.name = "lbWupin";
			temp.text = "物品使用次数：0/5";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 156;
			temp.x = 12;
			temp.y = 303;
			return temp;
		}

		private function line_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line = temp;
			temp.name = "line";
			temp.styleName = "ui/app/sevenday/image/fengexian.png";
			temp.width = 192;
			temp.x = 2;
			temp.y = 239;
			return temp;
		}

	}
}