package org.mokylin.skin.app.rank
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.rank.BossHurtRankProgressBarSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BossHurtRankListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var countProgress:feathers.controls.ProgressBar;

		public var hurtCountTxt:feathers.controls.Label;

		public var indexTxt:feathers.controls.Label;

		public var nameTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BossHurtRankListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 300;
			this.elementsContent = [countProgress_i(),nameTxt_i(),indexTxt_i(),hurtCountTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function countProgress_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			countProgress = temp;
			temp.name = "countProgress";
			temp.height = 24;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.rank.BossHurtRankProgressBarSkin);
			temp.width = 300;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function hurtCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			hurtCountTxt = temp;
			temp.name = "hurtCountTxt";
			temp.bold = true;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "99999";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 110;
			temp.x = 190;
			temp.y = 4;
			return temp;
		}

		private function indexTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			indexTxt = temp;
			temp.name = "indexTxt";
			temp.bold = true;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 40;
			temp.x = 0;
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
			temp.width = 150;
			temp.x = 40;
			temp.y = 4;
			return temp;
		}

	}
}