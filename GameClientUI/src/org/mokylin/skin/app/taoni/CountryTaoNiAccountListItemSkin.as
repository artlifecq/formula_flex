package org.mokylin.skin.app.taoni
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
	public class CountryTaoNiAccountListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemBg:feathers.controls.UIAsset;

		public var killBossCountTxt:feathers.controls.Label;

		public var killCountTxt:feathers.controls.Label;

		public var killEliteCountTxt:feathers.controls.Label;

		public var nameTxt:feathers.controls.Label;

		public var reliveCountTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryTaoNiAccountListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 580;
			this.elementsContent = [itemBg_i(),nameTxt_i(),killCountTxt_i(),reliveCountTxt_i(),killEliteCountTxt_i(),killBossCountTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 30;
			temp.styleName = "ui/common/version_3/J_jiesuan/lie_biao_bg.png";
			temp.width = 580;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function killBossCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			killBossCountTxt = temp;
			temp.name = "killBossCountTxt";
			temp.bold = true;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 464;
			temp.y = 4;
			return temp;
		}

		private function killCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			killCountTxt = temp;
			temp.name = "killCountTxt";
			temp.bold = true;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 163;
			temp.y = 4;
			return temp;
		}

		private function killEliteCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			killEliteCountTxt = temp;
			temp.name = "killEliteCountTxt";
			temp.bold = true;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 350;
			temp.y = 4;
			return temp;
		}

		private function nameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt = temp;
			temp.name = "nameTxt";
			temp.bold = true;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "玩家名字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 22;
			temp.y = 4;
			return temp;
		}

		private function reliveCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			reliveCountTxt = temp;
			temp.name = "reliveCountTxt";
			temp.bold = true;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 248;
			temp.y = 4;
			return temp;
		}

	}
}