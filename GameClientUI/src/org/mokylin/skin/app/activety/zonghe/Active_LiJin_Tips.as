package org.mokylin.skin.app.activety.zonghe
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
	public class Active_LiJin_Tips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbName:feathers.controls.Label;

		public var lbTip:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJin_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 113;
			this.width = 245;
			this.elementsContent = [__Active_LiJin_Tips_UIAsset1_i(),__Active_LiJin_Tips_UIAsset2_i(),lbName_i(),lbTip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJin_Tips_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 113;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJin_Tips_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/daobaoxiaoguai.png";
			temp.x = -55;
			temp.y = -31;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "【盗宝小怪】";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 151;
			temp.x = 8;
			temp.y = 11;
			return temp;
		}

		private function lbTip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTip = temp;
			temp.name = "lbTip";
			temp.height = 77;
			temp.htmlText = "1.活动开启则出现第一波盗宝小怪，<br>第<font color='#5DBD37'>5、10、15</font>分钟刷新<br>2.冬季盗宝下怪必掉礼金<br>3.攻击盗宝小怪额外获得<font color='#5DBD37'>5-10礼金</font>";
			temp.leading = 4;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 12;
			temp.y = 31;
			return temp;
		}

	}
}