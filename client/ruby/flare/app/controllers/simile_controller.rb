# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


class SimileController < ApplicationController
  def exhibit
    @data = @flare.search(0, 10)
                                          
    # Exhibit seems to require a label attribute to be happy
    @data.each {|d| d['label'] = d['title_text']}
    
    respond_to do |format| 
      format.html # renders exhibit.rhtml 
      format.json { render :json => {'items' => @data}.to_json } # Exhibit seems to require data to be in a 'items' Hash
    end                                         
  end
  
  def timeline
    @data = @flare.search(0, 10)
                                              
    respond_to do |format| 
      format.html # renders timeline.rhtml 
      format.xml # renders timeline.rxml
    end                                         
  end
end
