//
//  parser.h
//  A toyable language compiler (like a simple c++)
//  @author:jenson.zuo@gmail.com


#ifndef __TL_PARSER_H__
#define __TL_PARSER_H__

#include "compiler/common.h"
#include "compiler/parser/grammar.h"
#include "compiler/parser/location.h"
#include "compiler/parser/token.h"

namespace tlang {
    class Node {
        public:
            string name; // node name, such as terminal, or nonterminal  
            string assic; // token's assic
            int type;     // tokens' type 
            Location location;
            Node *parent;
            vector<Node*> childs;
        public:
            Node();
            Node(const string &name, int type, const string &value, Location &location); 
            ~Node();
            size_t count();
            void addChild(Node *node);
    };


    class Parser {
        public:
            Parser(const string &path, const string &file);
            ~Parser();
            bool prepare(); 
            Node* build(TokenStream *tokenStream);
            
        private:
            bool pushToken(Token *token);
            void push(GrammarNonterminalState *state, int nextState,  Token *token);
            void shift(int nextState, Token *token);
            void reduce(GrammarNonterminalState *state); 
            void popup();
            int  classify(Token *token);
            bool isFinalState(GrammarState *state); 
            void outputParseTree(Node *node, xmlNodePtr xmlNode);    
            GrammarNonterminalState* selectNonterminal(
                    map<GrammarNonterminalState* , int> &nonterminals, 
                    Token *token); 
            bool tryNonterminal(GrammarNonterminalState *nonterminal);
            bool recoveryError(GrammarNonterminalState *nonterminal, 
                    GrammarState *state,
                    Token *token);
        private:
            // stack item
            struct Item {
                GrammarNonterminalState* state; 
                int stateIndex;   
                int label;
                Node *node;
                Token *token;
            };
            
        private:
            string m_path;
            string m_file;
            string m_fullFileName; 
            Grammar *m_grammar;
            Node *m_root;
            int m_start;
            TokenStream *m_tokens; 
            // for xml output
            xmlNodePtr m_xmlRootNode;
            xmlDocPtr m_xmlDoc;
            stack<Item> m_items;
            // alternative nonterminal's match
            stack<Item> m_alternative;
    };

} // namespace tlang 
#endif // __TL_PARSER_H__
