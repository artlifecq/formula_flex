package org.mokylin.skin.app.zhanchang.jiucengyaota
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
	public class Tips_yaota extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_yaota()
		{
			super();
			
			this.currentState = "normal";
			this.height = 297;
			this.width = 212;
			this.elementsContent = [__Tips_yaota_UIAsset1_i(),__Tips_yaota_UIAsset2_i(),__Tips_yaota_UIAsset3_i(),__Tips_yaota_UIAsset4_i(),__Tips_yaota_Label1_i(),__Tips_yaota_Label2_i(),__Tips_yaota_Label3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_yaota_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "40级";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 112;
			temp.x = 84;
			temp.y = 23;
			return temp;
		}

		private function __Tips_yaota_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.leading = 4;
			temp.text = "每周二、四、五21:00~21:30";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 84;
			temp.y = 51;
			return temp;
		}

		private function __Tips_yaota_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 174;
			temp.htmlText = "1.每层击杀相应的人数可进入下一层，共<font color='#00ff33'>9</font>层。<br>2.高层复活点复活有几率降回前一层，原地复活不降层。<br>3.<font color='#00ff33'>1-5</font>层死亡复活点不会降层。<br>4.战场内可获得积分奖励和层数奖励。<br>5.<font color='#00ff33'>9</font>层玩家可争夺镇妖塔宝箱。";
			temp.leading = 4;
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 196;
			temp.x = 11;
			temp.y = 111;
			return temp;
		}

		private function __Tips_yaota_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 297;
			temp.styleName = "ui/app/zhanchang/jiucengyaota/bg2.png";
			temp.width = 212;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_yaota_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/dngjishijian.png";
			temp.x = 12;
			temp.y = 22;
			return temp;
		}

		private function __Tips_yaota_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/kaiqishijian.png";
			temp.x = 12;
			temp.y = 51;
			return temp;
		}

		private function __Tips_yaota_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/zhanchangguize.png";
			temp.x = 12;
			temp.y = 82;
			return temp;
		}

	}
}